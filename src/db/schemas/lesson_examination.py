from enum import Enum
from typing import Optional
from pydantic import BaseModel


class LevelChoice(str, Enum):
    ENTRY = "1"
    EASY = "2"
    NORMAL = "3"
    MEDIUM = "4"
    HARD = "5"


class Paper(BaseModel):
    """试卷模型类"""
    name: str = ""
    score: int = 100
    choice_number: int = 10
    fill_number: int = 10
    judge_number: int = 10
    program_number: int = 5
    level: LevelChoice = LevelChoice.ENTRY

    class Config:
        title = "Paper"
        schema_extra = {
            "example": {
                "name": "初级编程测试",
                "score": 100,
                "choice_number": 10,
                "fill_number": 10,
                "judge_number": 10,
                "program_number": 5,
                "level": "1",
            }
        }

    @staticmethod
    def calculate_score(choice_number: int, fill_number: int, judge_number: int, program_number: int) -> int:
        return (choice_number + fill_number + judge_number) * 2 + program_number * 8

# 在FastAPI应用中如何使用此模型
# 示例：
# from fastapi import FastAPI
# app = FastAPI()

# @app.post("/papers/")
# async def create_paper(paper: Paper):
#     paper.score = Paper.calculate_score(
#         paper.choice_number,
#         paper.fill_number,
#         paper.judge_number,
#         paper.program_number
#     )
#     # 这里省略了将paper数据持久化到数据库的操作
#     return paper
