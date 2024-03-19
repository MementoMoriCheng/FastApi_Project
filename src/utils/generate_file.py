#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/03/15
# @Author  : MementoMori
# @File    : sql_handle.py
# @Software: PyCharm

import os
import pandas as pd
from fpdf import FPDF
from openpyxl import Workbook


def generate_excel(table_list, output_path=None, file_name=None):
    """
    生成excel
    Args:
        table_list:
        output_path:
        file_name:

    Returns:

    """
    df = pd.DataFrame(table_list)
    wb = Workbook()
    wb.active = wb.create_sheet(title="Sheet1")
    wb.active.append(df.columns.tolist())
    for row in df.itertuples(index=False):
        wb.active.append(row)
    output_filename = os.path.join(output_path, file_name)
    # f"{output_filename}.xlsx"
    wb.save(output_filename)


def max_column_width(data, column_index):
    """
    获取某列中最长字符串的长度
    Args:
        data:
        column_index:

    Returns:

    """
    return max([len(str(row[column_index])) for row in data])


def generate_pdf(table_list, output_path=None, file_name=None):
    """
    生成pdf
    Args:
        table_list:
        output_path:
        file_name:

    Returns:

    """
    # pdf = FPDF()
    # PAGE_WIDTH = 190  # 单位毫米，此处仅为示例，实际值应为扣除页边距后的宽度
    pdf = FPDF("L")
    PAGE_WIDTH = 270  # 单位毫米，此处仅为示例，实际值应为扣除页边距后的宽度

    simfang_path = "src/static/simfang.ttf"
    pdf.add_page()
    pdf.set_auto_page_break(auto=True, margin=15)  # 自动分页
    pdf.add_font('simfang', '', simfang_path, uni=True)
    pdf.set_font('simfang', '', 14)

    column_titles = list(table_list[0].keys())
    user_data = [list(row.values()) for row in table_list]

    # 计算每列的最大宽度
    max_widths = [max_column_width(user_data, i) for i in range(len(column_titles))]

    column_widths = [int(PAGE_WIDTH * w / sum(max_widths)) for w in max_widths]
    # 将数据写入PDF
    for i, (title, width) in enumerate(zip(column_titles, column_widths)):
        pdf.cell(width, 10, txt=title, border=1, align='C' if i == 0 else 'L', ln=(i == len(table_list[0]) - 1))
    for record in user_data:
        for col_idx, (value, width) in enumerate(zip(record, column_widths)):
            pdf.cell(width, 10, txt=str(value), border=1, ln=(col_idx == len(record) - 1),
                     align='C' if col_idx == 0 else 'L')

    # 指定要保存的路径
    output_path = "E:\\LOCAL_DOWNLOAD_FILE_PATH\\file.pdf"

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    pdf.output(output_path)
