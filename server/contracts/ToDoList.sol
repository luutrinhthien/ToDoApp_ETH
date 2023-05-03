// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

contract ToDoList {
    event AddTasks(address recipient, uint id);
    event DeleteTasks(uint id);

    struct Task {
        uint id;
        string Text;
        bool isDeleted;
    }

    Task[] private TasksList;
    mapping(uint => address) TaskOfOwner;

    function getTasks() external view returns (Task[] memory) {
        Task[] memory temp = new Task[](TasksList.length);
        uint32 counter;
        for (uint i; i < TasksList.length; i++) {
            if (
                TaskOfOwner[i] == msg.sender && TasksList[i].isDeleted == false
            ) {
                temp[counter] = TasksList[i];
                counter++;
            }
        }

        Task[] memory resultTask = new Task[](counter);
        for (uint i; i < counter; i++) {
            resultTask[i] = temp[i];
        }
        return resultTask;
    }

    function addTasks(string memory text, bool isDeleted) external {
        uint id = TasksList.length;

        TasksList.push(Task(id, text, isDeleted));
        TaskOfOwner[id] = msg.sender;

        emit AddTasks(msg.sender, id);
    }

    function deleteTasks(uint id) external {
        if (TaskOfOwner[id] == msg.sender) {
            TasksList[id].isDeleted = true;
            emit DeleteTasks(id);
        }
    }
}
