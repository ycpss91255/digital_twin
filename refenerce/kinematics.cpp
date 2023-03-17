#include <sstream>
#include "std_msgs/Bool.h"

#include "ros/ros.h"
#include "geometry_msgs/Twist.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "kinematics");
  ros::NodeHandle n;
  ros::Publisher kinematics_pub = n.advertise<geometry_msgs::Twist>("kinematics", 1000);

  ros::Rate loop_rate(10);

  while (ros::ok())
  {

    std_msgs::String msg;
    std::stringstream ss;
    ss << "hello world " << count;
    msg.data = ss.str();
    ROS_INFO("%s", msg.data.c_str());
    chatter_pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();
    ++count;
  }


  return 0;
}
// %EndTag(FULLTEXT)%
