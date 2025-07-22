import os
import json
from mineru import MinerU
from mineru.models import ParseConfig, OutputType


def parse_pdf_with_mineru(input_pdf, output_dir=None, extract_tables=True, extract_images=False):
    """
    使用 MinerU 解析 PDF 文档

    参数:
    input_pdf (str): PDF 文件路径
    output_dir (str): 输出目录路径（默认为 PDF 同目录）
    extract_tables (bool): 是否提取表格数据（默认为 True）
    extract_images (bool): 是否提取图片（默认为 False）

    返回:
    dict: 解析结果
    """
    # 检查文件是否存在
    if not os.path.isfile(input_pdf):
        raise FileNotFoundError(f"PDF 文件不存在: {input_pdf}")

    # 设置输出目录
    if output_dir is None:
        output_dir = os.path.dirname(input_pdf) or "."

    # 确保输出目录存在
    os.makedirs(output_dir, exist_ok=True)

    # 创建 MinerU 解析器实例
    parser = MinerU()

    # 配置解析选项
    config = ParseConfig(
        extract_tables=extract_tables,
        extract_images=extract_images,
        output_type=OutputType.JSON,  # 输出为 JSON 格式
        output_path=output_dir,  # 设置输出目录
        table_format="markdown"  # 表格输出为 Markdown 格式
    )

    try:
        print(f"开始解析 PDF: {os.path.basename(input_pdf)}")

        # 解析 PDF
        result = parser.parse_file(input_pdf, config=config)

        # 保存完整结果到 JSON 文件
        output_json = os.path.join(output_dir, f"{os.path.splitext(os.path.basename(input_pdf))[0]}_result.json")
        with open(output_json, 'w', encoding='utf-8') as f:
            json.dump(result, f, ensure_ascii=False, indent=2)

        print(f"解析完成！结果已保存到: {output_json}")

        # 提取并打印关键信息
        print("\n文档摘要:")
        print(f"- 页数: {result['metadata']['page_count']}")
        print(f"- 标题: {result['metadata'].get('title', '未知')}")
        print(f"- 作者: {result['metadata'].get('author', '未知')}")

        # 提取文本内容示例
        if 'content' in result and result['content']:
            first_page_text = result['content'][0]['text'][:300]  # 第一页前300字符
            print(f"\n第一页内容摘要:\n{first_page_text}...")

        # 提取表格示例
        if extract_tables and 'tables' in result and result['tables']:
            print(f"\n检测到 {len(result['tables'])} 个表格")
            for i, table in enumerate(result['tables'][:2], 1):  # 显示前两个表格
                print(f"\n表格 {i} (位于第 {table['page_number']} 页):")
                # 只打印表格前几行
                rows = table['content'].split('\n')
                for row in rows[:5]:
                    print(row)
                if len(rows) > 5:
                    print(f"...省略 {len(rows) - 5} 行")

        return result

    except Exception as e:
        print(f"解析失败: {str(e)}")
        raise


if __name__ == "__main__":
    # 示例用法
    import argparse

    parser = argparse.ArgumentParser(description="使用 MinerU 解析 PDF 文档")
    parser.add_argument("pdf_file", help="PDF 文件路径")
    parser.add_argument("-o", "--output", help="输出目录", default=None)
    parser.add_argument("--no-tables", action="store_true", help="不提取表格")
    parser.add_argument("--extract-images", action="store_true", help="提取图片")

    args = parser.parse_args()

    # 调用解析函数
    result = parse_pdf_with_mineru(
        input_pdf=args.pdf_file,
        output_dir=args.output,
        extract_tables=not args.no_tables,
        extract_images=args.extract_images
    )