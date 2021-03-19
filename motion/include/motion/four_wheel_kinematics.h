#ifndef FourWheelKinematics_H
#define FourWheelKinematics_H

#include <iostream>

class FourWheelKinematics {
public:
  void ForwardKinematics();
  void InverseKinematics();

private:
  const float RobotRadius = 0.0955;
  // const float
};

#endif // FourWheelKinematics_H
