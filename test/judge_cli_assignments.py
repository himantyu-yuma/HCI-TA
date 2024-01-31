import pathlib
import argparse
import docker
import re
import pandas as pd

day = "day2"
kadai_map = {
    "FizzBuzz.rb": "kadai1-1"
}

def get_assignments():
    current_dir = pathlib.Path(__file__).parent
    assignments_dir = current_dir / f'../assignments/{day}/students/'
    assignments = [x for x in assignments_dir.iterdir() if x.is_dir()]
    return assignments


def exec_program(target_dir, assignment_file, container_name):
    target_dir = pathlib.Path(target_dir)
    paths = target_dir.rglob(assignment_file)
    paths = list(paths)
    # pathが空もしくは二つ以上の場合はエラーを出す
    if len(paths) != 1:
        raise Exception("error")
    assignment_path = paths[0].relative_to(target_dir.parent.parent.parent.parent)
    print(assignment_path)
    client = docker.from_env()
    command = f"bash -c 'cd {assignment_path.parent.as_posix()} && echo '10' | ruby {assignment_path.name}'"
    container = client.containers.get(container_name)
    response = container.exec_run(command)
    print(response.output.decode('utf-8'))


def judge(student_id, assignment_name, score):
    current_dir = pathlib.Path(__file__).parent
    grade_path = current_dir.parent / f"assignments/{day}/grades.csv"
    grade_df = pd.read_csv(grade_path, dtype={"student_id": str})

    grade_df = grade_df.set_index(["student_id", "assignment_name"])
    grade_df.loc[(student_id, assignment_name), "score"] = score
    grade_df = grade_df.reset_index()
    grade_df.to_csv(grade_path, index=False)
    readable_grade_path = current_dir.parent / "assignments" / day / "readable_grades.csv"
    pivot_df = grade_df.pivot(index="student_id", columns="assignment_name", values="score").reset_index()
    pivot_df.to_csv(readable_grade_path, index=False)


if __name__ == '__main__':
    assignment_list = []
    # get commandline args
    parser = argparse.ArgumentParser()
    parser.add_argument('-a', '--assignment', help='課題ファイル名')
    parser.add_argument('-c', '--container', help='コンテナ名')
    args = parser.parse_args()
    # print(args.assignment)
    assignments = get_assignments()

    assignments = get_assignments()
    for assignment in assignments:
        student_id = re.search(r's(\d{8})', assignment.name).group(1)
        try:
            exec_program(assignment, args.assignment, args.container)
            score = input("点数: ")
        except Exception as e:
            print("internaal error:", e)
            score = -1
        finally:
            # kadai_mapにkeyが存在するかどうか
            if args.assignment in kadai_map:
                assignment_name = kadai_map[args.assignment]
            else:
                assignment_name = args.assignment
            judge(student_id, assignment_name, int(score))