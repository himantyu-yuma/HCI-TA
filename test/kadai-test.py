import docker

client = docker.from_env()

container_name = '/hci-ta-vanilla-1'
command = "ruby assignments/day4/students/p23015561-パート2「データベースフレームワークを使ったWebプログラミング」のレポート提出：10月30日(月)-686044/s02180911a_1843666_assignsubmission_file_/02180911/kadai3-4/lab_search.rb"

container = client.containers.get(container_name)
response = container.exec_run(command)

print(response.output.decode('utf-8'))