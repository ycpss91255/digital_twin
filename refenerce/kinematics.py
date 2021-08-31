from math import *
import numpy as np
import time as t

WHEEL_RADIUS = 2.95
CENTER_TO_WHEEL = 7
TICKS_PER_REVOLUTION = 538
MAX_RPM = 300
REVOLUTIONS_PER_SECOND = MAX_RPM / 60
RADIANS_PER_SECOND = MAX_RPM / 30
TICKS_PER_RADIAN = TICKS_PER_REVOLUTION / 2
TICKS_PER_SECOND = REVOLUTIONS_PER_SECOND * TICKS_PER_REVOLUTION
CONVERSION_METERS_TO_INCHES = [39.37, 39.37, 1]


def calculate_velocity_from_powers(powers):
    wheel_1_angular_velocity = powers[0]
    wheel_2_angular_velocity = powers[1]
    wheel_3_angular_velocity = powers[2]
    wheel_4_angular_velocity = powers[3]

    velocity_x = (wheel_1_angular_velocity +
                  wheel_2_angular_velocity +
                  wheel_3_angular_velocity +
                  wheel_4_angular_velocity) * (WHEEL_RADIUS / 4)

    velocity_y = (-wheel_1_angular_velocity +
                  wheel_2_angular_velocity +
                  wheel_3_angular_velocity +
                  -wheel_4_angular_velocity) * (WHEEL_RADIUS / 4)

    angular_velocity = (-wheel_1_angular_velocity +
                        wheel_2_angular_velocity +
                        -wheel_3_angular_velocity +
                        wheel_4_angular_velocity) * (WHEEL_RADIUS / (8 * CENTER_TO_WHEEL))

    return [velocity_x, velocity_y, angular_velocity]


def calculate_powers_from_velocity(velocity_x, velocity_y, velocity_angular):
    reciprocal_radius = 1 / WHEEL_RADIUS
    wheel_1_angular_velocity = reciprocal_radius * \
        (velocity_x - velocity_y - (velocity_angular * (2 * CENTER_TO_WHEEL)))
    wheel_2_angular_velocity = reciprocal_radius * \
        (velocity_x + velocity_y + (velocity_angular * (2 * CENTER_TO_WHEEL)))
    wheel_3_angular_velocity = reciprocal_radius * \
        (velocity_x + velocity_y - (velocity_angular * (2 * CENTER_TO_WHEEL)))
    wheel_4_angular_velocity = reciprocal_radius * \
        (velocity_x - velocity_y + (velocity_angular * (2 * CENTER_TO_WHEEL)))
    vel = np.array([wheel_1_angular_velocity, wheel_2_angular_velocity,
                   wheel_3_angular_velocity, wheel_4_angular_velocity])
    return vel


def move_steps(pos, powers, time, should_print):
    start_time = t.time()
    should_continue = True
    while should_continue:
        velocity = calculate_velocity_from_powers(powers)
        a = pos[2]
        vx = velocity[0]
        vy = velocity[1]
        da = velocity[2]
        a += da

        real_vx = (vx * cos(a)) - (vy * sin(a))
        real_vy = (vy * cos(a)) + (vx * sin(a))

        pos = np.add(pos, [real_vx, real_vy, 0])
        pos[2] = a

        if should_print:
            print_info(pos)

        if (t.time() - start_time) > time:
            should_continue = False

    return pos


def print_info(pos):
    print('The robot is at ' +
          str(pos[0:2])+' and facing an angle of '+str(degrees(pos[2]))+' degrees.')


def convert_power_into_rps(a):
    d = np.interp(a, (-1, 1), (-RADIANS_PER_SECOND, RADIANS_PER_SECOND))
    return d


def convert_velocities_from_meters_to_inches(velocities):
    return np.multiply(velocities, CONVERSION_METERS_TO_INCHES)


# robot_pos = [0, 0, 0]
#
# robot_pos = move_steps(robot_pos, [0.01, 0.01, 0.01, 0.01], 1, True)
print(calculate_velocity_from_powers(
    convert_power_into_rps([0.1, 0.1, 0.1, 0.1])))
