# 実験方法

1. change directory
    ```bash
    cd UR-Robotiq-Integrated-Driver
    ```

2. run docker-container 
    ```bash
    ./docker/run.sh
    ```

3. preparation 
    ```bash
    apt-get update && rosdep update && rosdep install --from-paths src --ignore-src -r -y && colcon build --symlink-install && source install/setup.bash　
    ```

4. launch driver to move robot 
    ```bash
    ros2 launch ur_robot_driver ur_control.launch.py ur_type:=ur3e robot_ip:=192.168.1.20 reverse_ip:=192.168.1.100 use_tool_communication:=true
    ```

5. (plz open new terminal)
    ```bash
    docker exec -it rvl-ur-robotiq-container bash
    ```

6. launch driver to move robotiq gripper
    ```bash
    source install/setup.bash && ros2 run rvl_robotiq_driver robotiq_controller
    ```

7.  (plz open new terminal)
    ```bash
    docker exec -it rvl-ur-robotiq-container bash 
    ```

8. activate robotiq gripper
    ```bash
    cd /root/colcon_ws && source install/setup.bash && ros2 service call /robotiq/activate std_srvs/srv/Trigger
    ```

9. strong close && open
    ```bash
    ros2 service call /robotiq/auto_close/strong std_srvs/srv/Trigger
    ```

    ```bash
    ros2 service call /robotiq/auto_open/strong std_srvs/srv/Trigger
    ```

10. medium close && open
    ```bash
    ros2 service call /robotiq/auto_close/medium std_srvs/srv/Trigger
    ```

    ```bash
    ros2 service call /robotiq/auto_open/medium std_srvs/srv/Trigger
    ```

11. fragile close && open
    ```bash
    ros2 service call /robotiq/auto_close/fragile std_srvs/srv/Trigger
    ```

    ```bash
    ros2 service call /robotiq/auto_open/fragile std_srvs/srv/Trigger
    ```

12. soft close && open
    ```bash
    ros2 service call /robotiq/auto_close/soft std_srvs/srv/Trigger
    ```

    ```bash
    ros2 service call /robotiq/auto_open/soft std_srvs/srv/Trigger
    ```

13. close && open (soft medium strong etc...)
    ```bash
    ./grip.bash soft
    ```
    
    ```bash
    ./grip.bash medium
    ```

    ```bash
    ./grip.bash strong
    ```

    ```bash
    chmod +x grip.bash
    ```
