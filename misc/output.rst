def List(size)(size,initialList):
    """Parameters:
~~~~~~~~~~~

Size:
^^^^^

A positive integer - sets the number of integers in the new list.

| The maximum size is 250 integers.

Returns:
~~~~~~~~

N/A

Ed.List(size,initialList)
-------------------------

.. _parameters-1:

Parameters:
~~~~~~~~~~~

.. _size-1:

Size:
^^^^^

A positive integer - sets the number of integers in the new list.

The maximum size is 250 integers.

Initial List:
^^^^^^^^^^^^^

A python style list e.g. [1,2,3] - sets the initial value of the
integers in the new Ed.List.

.. _returns-1:

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

| Creates a list of Edison variables.

Examples:
~~~~~~~~~

Create an empty list and fill with zeros.

::

   #--------Your code below-----------

   zeros=Ed.List(5)

   for x in range(5):

       zeros[x]=0

Create a new list with pre-filled values.

::

   #--------Your code below-----------

   example=Ed.List(5,[1,2,3,4,5])

Watch out for:
~~~~~~~~~~~~~~

The maximum list size is 250.

Additional new elements cannot be added to the end of the list. The list
is a fixed size. Python lists are "0 index" lists, meaning the first
element in the list is at index 0. For example, using the pre-filled
list from the above example, the following code would flash Edison's LED
once.

::

   while example[0]!=0:

       Ed.LeftLed(Ed.ON)

       Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

       Ed.LeftLed(Ed.OFF)

       Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

       example[0]=example[0]-1

"""

def LeftLed(state):
    """Parameters:
~~~~~~~~~~~

State:
^^^^^^

-  Ed.ON û LED turns on
-  Ed.OFF û LED turns off

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Turns EdisonÆs left LED on or off.

Examples:
~~~~~~~~~

Quick flash of left LED.

::

   #--------Your code below-----------

   Ed.LeftLed(Ed.ON)

   Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

   Ed.LeftLed(Ed.OFF)

   Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Left LED on while driving.

::

   #--------Your code below-----------

   Ed.LeftLed(Ed.ON)

   Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 10)

   Ed.LeftLed(Ed.OFF)

Watch out for:
~~~~~~~~~~~~~~

If used to turn Edison's LED on, another function call is needed later
in the code to turn Edison's LED off.

"""

def RightLed(state):
    """Parameters:
~~~~~~~~~~~

State:
^^^^^^

-  Ed.ON û LED turns on
-  Ed.OFF û LED turns off

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Turns EdisonÆs right LED on or off.

Examples:
~~~~~~~~~

Quick flash of right LED.

::

   #--------Your code below-----------

   Ed.RightLed(Ed.ON)

   Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

   Ed.RightLed(Ed.OFF)

   Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Right LED on while driving.

::

   #--------Your code below-----------

   Ed.RightLed(Ed.ON)

   Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 10)

   Ed.RightLed(Ed.OFF) 

` <https://meetedison.com/>`__

Watch out for:
~~~~~~~~~~~~~~

| If used to turn Edison's LED on, another function call is needed later
  in the code to turn Edison's LED off.

"""

def ObstacleDetectionBeam(state):
    """Parameters:
~~~~~~~~~~~

State:
^^^^^^

-  Ed.ON û Obstacle detection functions are enabled.
-  Ed.OFF û Obstacle detection functions are disabled.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Turns EdisonÆs obstacle detection IR system on or off. This is required
to use other obstacle detection functions.

Examples:
~~~~~~~~~

Turn on the obstacle detection beam and beep at obstacles.

::

   #--------Your code below-----------

   Ed.ObstacleDetectionBeam(Ed.ON)

   while True:

       if Ed.ReadObstacleDetection()>Ed.OBSTACLE_NONE:

           Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

While the obstacle detection beam needs to be turned on to enable Edison
to detect an obstacle, this function is not used to detect obstacles.
Use Ed.ReadObstacleDetection() to have Edison react to obstacles.

Edison's obstacle detection and IR messaging functions both use the same
IR LEDs and IR receiver. Therefore, Edison cannot send or receive
messages from other Edison robots if the obstacle detection beam is
turned on.

"""

def LineTrackerLed(state):
    """Parameters:
~~~~~~~~~~~

State:
^^^^^^

-  Ed.ON û LED turns on
-  Ed.OFF û LED turns off

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Turns EdisonÆs line tracker LED on or off. This is required to use other
line tracking functions.

Examples:
~~~~~~~~~

Turn on the line tracking LED and beep when a black surface is detected.

::

   #--------Your code below-----------

   Ed.LineTrackerLed(Ed.ON)

   while True:

       if Ed.ReadLineState()==Ed.LINE_ON_BLACK:

           Ed.PlayBeep() 

Watch out for:
~~~~~~~~~~~~~~

Always start the Edison robot on a white surface when running a program
with this function. When Edison turns on the line tracking LED, a
reading from the line tracking sensor is taken. This first reading is
set to be a white surface and the Ed.ReadLineState() function uses this
as a baseline. If the line tracking LED is turned on while the robot is
over a black line, this will cause an error where Edison cannot find
something which reflects less light, and will therefore never return the
LINE_ON_BLACK condition.

While the line tracking LED needs to be turned on to enable Edison to
detect a line, this function is not used to react to lines. Use
Ed.ReadLineState() to have Edison react to lines.

"""

def SendIRData(byte):
    """Parameters:
~~~~~~~~~~~

Byte:
^^^^^

A positive integer between 0-255 to send to all nearby Edison robots.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sends one byte of data out to be received by other Edison robots via
infrared.

Examples:
~~~~~~~~~

Send a simple value.

::

   #--------Your code below-----------

   Ed.SendIRData(10)

Send line tracking data.

::

   #--------Your code below-----------

   Ed.LineTrackerLed(Ed.ON)

   lineState = Ed.ReadLineState()

   Ed.SendIRData(lineState)

Watch out for:
~~~~~~~~~~~~~~

| Only 8-bit variables (range of 0-255) can be sent. Since EdPy uses
  16-bit variables, this function ignores the top 8 bits of any input.

| 

"""

def RegisterEventHandler(event, function):
    """Parameters:
~~~~~~~~~~~

State:
^^^^^^

-  Ed.EVENT_TIMER_FINISHED - Calls the function when the countdown timer
   finishes.

-  Ed.EVENT_REMOTE_CODE - Calls the function when Edison receives a
   remote code.

-  Ed.EVENT_IR_DATA - Calls the function when Edison receivescode from
   another Edison.

-  Ed.EVENT_CLAP_DETECTED - Calls the function when Edison detects a
   clap.

-  Ed.EVENT_OBSTACLE_ANY - Calls the function when Edison detects any
   obstacle.

-  Ed.EVENT_OBSTACLE_LEFT - Calls the function when Edison detects an
   obstacle to the left.

-  Ed.EVENT_OBSTACLE_RIGHT - Calls the function when Edison detects an
   obstacle to the right.

-  Ed.EVENT_OBSTACLE_AHEAD - Calls the function when Edison detects an
   obstacle straight ahead.

-  Ed.EVENT_DRIVE_STRAIN - Calls the function when Edison detects strain
   on the drive.

-  Ed.EVENT_KEYPAD_TRIANGLE - Calls the function when Edison detects a
   triangle button press.

-  Ed.EVENT_KEYPAD_ROUND - Calls the function when Edison detects a
   round button press.

-  Ed.EVENT_LINE_TRACKER_ON_WHITE - Calls the function when Edison
   detects a white surface under the line tracker.

-  Ed.EVENT_LINE_TRACKER_ON_BLACK - Calls the function when Edison
   detects a black surface under the line tracker.

-  Ed.EVENT_LINE_TRACKER_SURFACE_CHANGE - Calls the function when Edison
   detects a surface change under the line tracker.

-  Ed.EVENT_TUNE_FINISHED - Calls the function when Edison finishes
   playing a tune.

Function:
^^^^^^^^^

The string name of a user-created function to be called when an event
occurs.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sets up an æevent handlerÆ, causing Edison to call a function when a
given event occurs.

Examples:
~~~~~~~~~

Flash the left LED forever and beep whenever an obstacle is detected.

::

   #--------Your code below-----------

   Ed.ObstacleDetectionBeam(Ed.ON)

   Ed.RegisterEventHandler(Ed.EVENT_OBSTACLE_ANY, "whenObsBeep")

   while True:

       Ed.LeftLed(Ed.ON)

       Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

       Ed.LeftLed(Ed.OFF)

       Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

   def whenObsBeep():

       Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

Event handlers act as an interrupt, which means that when the event
occurs, the main program is paused while the given function is run. When
the function completes, the main program continues where it left off.

| 

"""

def PlayBeep():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sounds a single beep with frequency: 3.5KHz, duration: 50ms (0.05
seconds).

Examples:
~~~~~~~~~

Play a beep.

::

   #--------Your code below-----------

   Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

All of Edison's sounds occur in the background. As such, Edison moves
onto the next line of code as soon as the sound starts without waiting
for the sound to finish. To make Edison wait for the sound to finish,
use the Ed.ReadMusicEnd() function in a loop.

"""

def PlayMyBeep(period):
    """Parameters:
~~~~~~~~~~~

Period:
^^^^^^^

The period is how long it takes an acoustic wave to complete a full
cycle. Changing this number causes a change in the frequency of the
sound played because when period increases, frequency decreases. To
convert a frequency into a period, divide the number 8,000,000 by the
desired frequency.

For example, to play a 1kHz (1000 cycles per second) sound:
8,000,000/1,000 = 8,000

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sounds a single beep with a given period for a duration of 50ms (0.05
seconds).

Examples:
~~~~~~~~~

Play a beep at 1Khz (8000 period).

::

   #--------Your code below-----------

   Ed.PlayMyBeep(8000)

Watch out for:
~~~~~~~~~~~~~~

All of Edison's sounds occur in the background. As such, Edison moves
onto the next line of code as soon as the sound starts without waiting
for the sound to finish. To make Edison wait for the sound to finish,
use the Ed.ReadMusicEnd() function in a loop.

The largest number Edison can use is 32767, which means Edison cannot
handle the number 8000000 which is required to convert frequency to
period. Therefore, you will need to calculate the period you want before
programming Edison and use this as the number in your program.

"""

def PlayTune(Tune):
    """Parameters:
~~~~~~~~~~~

Tune:
~~~~~

Takes an Edison tune, which is a Python-style string which needs to be
created using the Ed.TuneString() function.

A tune string looks like this: "ndndndndndnd...ndz" where n is a note
from the notes table, and d isduration from the duration table û see
below.

Notes:
^^^^^^

m - low A

M - low sharp A

n - low B

c - C

C - C sharp

d - D

D - D sharp

e - E

f - F

F - F sharp

g - G

G - G sharp

a - A

A - A sharp

b - B

| o - high C

Duration:
^^^^^^^^^

1 - whole note

2 - half note

4 - quarter note

8 - eighth note

6 - sixteenth note

Other:
^^^^^^

r - rest

z - end of tune

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Plays a string of musical notes through the speaker. This is done by
passing the function a ætune stringÆ made up of a string of notes using
the tables above as a reference using the Ed.TuneString() function. You
can change the speed you tune plays by changing what Ed.Tempo is set to
in the setup code.

Examples:
~~~~~~~~~

Play a simple tune.

::

   #--------Your code below-----------

   simple = Ed.TuneString(25, "d4e4f4e4d4c4n2d4e4f4e4d1z")

   Ed.PlayTune(simple)

   while Ed.ReadMusicEnd()==Ed.MUSIC_NOT_FINISHED:

       pass

Watch out for:
~~~~~~~~~~~~~~

The function must use a Python-style string which needs to be created
using the Ed.TuneString() function.

All tune strings need to end with a "z" character to end correctly.

All of Edison's sounds occur in the background. As such, Edison moves
onto the next line of code as soon as the sound starts without waiting
for the sound to finish. To make Edison wait for the sound to finish,
use the Ed.ReadMusicEnd() function in a loop.

You can change the speed you tune plays by changing what Ed.Tempo is set
to in the setup code.

"""

def TuneString(size)(size,initialTune):
    """Parameters:
~~~~~~~~~~~

Size:
^^^^^

A positive integer - sets the number of characters in the new string.

The maximum size is 250 integers.

Returns:
~~~~~~~~

N/A

Ed.TuneString(size,initialTune)
-------------------------------

.. _parameters-1:

Parameters:
~~~~~~~~~~~

.. _size-1:

Size:
^^^^^

A positive integer - sets the number of characters in the new string.

The maximum size is 250 integers.

InitialTune:
^^^^^^^^^^^^

A Python-style string, for example "a4g2z", which sets the notes to be
played in the tune.

A tune string looks like this: "ndndndndndnd...ndz" where n is a note
from the notes table, and d isduration from the duration table û see
below.

Notes:
^^^^^^

m - low A

M - low sharp A

n - low B

c - C

C - C sharp

d - D

D - D sharp

e - E

f - F

F - F sharp

g - G

G - G sharp

a - A

A - A sharp

b - B

| o - high C

Duration:
^^^^^^^^^

1 - whole note

2 - half note

4 - quarter note

8 - eighth note

6 - sixteenth note

Other:
^^^^^^

R - rest

z - end of the tune

.. _returns-1:

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

| Creates a new tune string which can be used with the Ed.PlayTune()
  function.

Examples:
~~~~~~~~~

Play a simple tune.

::

   #--------Your code below-----------

   simple = Ed.TuneString(25, "d4e4f4e4d4c4n2d4e4f4e4d1z")

   Ed.PlayTune(simple)

   while Ed.ReadMusicEnd()==Ed.MUSIC_NOT_FINISHED:

       pass

Watch out for:
~~~~~~~~~~~~~~

The function will not play a tune, but only creates a Python-style
string. To play the tune, use the Ed.PlayTune() function.

The maximum tune size is 250 characters.

All tune strings need to end with a "z" character to end correctly.

All of Edison's sounds occur in the background. As such, Edison moves
onto the next line of code as soon as the sound starts without waiting
for the sound to finish. To make Edison wait for the sound to finish,
use the Ed.ReadMusicEnd() function in a loop.

| You can change the speed you tune plays by changing what Ed.Tempo is
  set to in the setup code.

"""

def Drive(direction,speed,distance):
    """Parameters:
~~~~~~~~~~~

Direction:
^^^^^^^^^^

-  Ed.FORWARD - Edison drives forwards.
-  Ed.BACKWARD - Edison drives backwards.
-  Ed.FORWARD_RIGHT - Edison uses one wheel to turn forwards right
   (clockwise).
-  Ed.BACKWARD_RIGHT - Edison uses one wheel to turn backwards right
   (counter-clockwise).
-  Ed.FORWARD_LEFT - Edison uses one wheel to turn forwards left
   (counter-clockwise).
-  Ed.BACKWARD_LEFT - Edison uses one wheel to turn backwards left
   (clockwise).
-  Ed.SPIN_RIGHT - Edison spins on the spot to the right (clockwise).
-  Ed.SPIN_LEFT - Edison spins on the spot to the left
   (counter-clockwise).
-  Ed.STOP - Stops Edison immediately.

Speed:
^^^^^^

-  A positive integer number between 1-10.
-  Ed.SPEED_1 - PWM controlled speed 1.
-  Ed.SPEED_2 - PWM controlled speed 2.
-  Ed.SPEED_3 - PWM controlled speed 3.
-  Ed.SPEED_4 - PWM controlled speed 4.
-  Ed.SPEED_5 - PWM controlled speed 5.
-  Ed.SPEED_6 - PWM controlled speed 6.
-  Ed.SPEED_7 - PWM controlled speed 7.
-  Ed.SPEED_8 - PWM controlled speed 8.
-  Ed.SPEED_9 - PWM controlled speed 9.
-  Ed.SPEED_10 - PWM controlled speed 10.
-  Ed.SPEED_FULL - Full power to the motors. (Please note- Edison may
   not drive perfectly straight with this setting).

Distance:
^^^^^^^^^

-  An integer number for distance. The maximum value is 32767.

OR

-  Ed.DISTANCE_UNLIMITED - turns on Edison's motors and moves on with
   the code. (Note: a stop will be needed later in the code.)

If using an integer number, note that the unit value of this number is
set by Ed.DistanceUnits in the setup code. You can change the unit value
by changing what Ed.DistanceUnits is set to in the setup code.

-  Ed.DistanceUnits = Ed.CM - distance in centimetres(default for V2.0).
-  Ed.DistanceUnits= Ed.INCH - distance in inches.
-  Ed.DistanceUnits= Ed.TIME - distance in milliseconds (default for
   V1).

Note: When Edison is turning and Ed.DistanceUnitsis set to CM or INCH,
distancebecomes the number of degrees to turn with a maximum value of
360.

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Controls both of Edison's motors to create movement. This can be set to
move for a set distance (CM or INCH) or time period (TIME) and will
drive the full distance before moving onto the next line of code.

Examples:
~~~~~~~~~

Drive Edison forward for 3 cm at speed 5. (Edison V2.0 only)

::

   Ed.DistanceUnits = Ed.CM

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 3)

| Drive Edison forward for 5 inches at speed 5. (Edison V2.0 only)

::

   Ed.DistanceUnits = Ed.INCH

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.Drive(Ed.FORWARD, Ed.SPEED_5, 5)

Drive Edison forward for 2000 milliseconds at speed 7.

::

   Ed.DistanceUnits = Ed.TIME

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.Drive(Ed.FORWARD, Ed.SPEED_7, 2000)

Spin Edison left 90 degrees at speed 10.

::

   Ed.DistanceUnits = Ed.CM

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.Drive(Ed.SPIN_LEFT, 10, 90)

Set speed and distance with variables.

::

   Ed.DistanceUnits = Ed.CM

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   driveSpeed=5

   driveDistance=10

   Ed.Drive(Ed.FORWARD, driveSpeed, driveDistance)

Watch out for:
~~~~~~~~~~~~~~

Distance units of CM and INCH are only available for Edison V2.0. If you
are using a V1 Edison, please make sure that Ed.DistanceUnits= Ed.TIME.

The Ed.TIME constant is in milliseconds. When Ed.DistanceUnits= Ed.TIME,
remember that the distance input integer is milliseconds. Example: to
drive for 2 seconds, a distance of 2000 should be input.

When Edison is turning and Ed.DistanceUnits is set to CM or INCH,
distance becomes the number of degrees to turn with a maximum value of
360. If you put in a value above 360, the code will wrap the value
around and Edison will perform a shorter turn. Example: an input of 380
will cause Edison to turn 20 degrees.

Ed.SPEED_FULL turns Edison's motors up to the maximum value. As such
Edison has no control over the speed and Edison V2.0s will not be able
to use their encoders to correct for driving drift.

Setting distance to 0 orEd.DISTANCE_UNLIMITED makes Edison turn on the
motors and move on with the code. An additional Ed.Drive() will be
required later in the code to stop or change the direction of movement.

When the distance input is set to anything other than 0
orEd.DISTANCE_UNLIMITED, Edison will drive for the full distance
supplied before moving on to the next line of code.

"""

def DriveLeftMotor(direction,speed,distance):
    """Parameters:
~~~~~~~~~~~

Direction:
^^^^^^^^^^

-  Ed.FORWARD - Edison's left motor drives forwards.
-  Ed.BACKWARD - Edison's left motor drives backwards.
-  Ed.STOP - Stops Edison's left motor immediately.

Speed:
^^^^^^

-  A positive integer number between 1-10.
-  Ed.SPEED_1 - PWM controlled speed 1.
-  Ed.SPEED_2 - PWM controlled speed 2.
-  Ed.SPEED_3 - PWM controlled speed 3.
-  Ed.SPEED_4 - PWM controlled speed 4.
-  Ed.SPEED_5 - PWM controlled speed 5.
-  Ed.SPEED_6 - PWM controlled speed 6.
-  Ed.SPEED_7 - PWM controlled speed 7.
-  Ed.SPEED_8 - PWM controlled speed 8.
-  Ed.SPEED_9 - PWM controlled speed 9.
-  Ed.SPEED_10 - PWM controlled speed 10.
-  Ed.SPEED_FULL - Full power to the motors. (Please note- Edison may
   not drive perfectly straight with this setting.)

Distance:
^^^^^^^^^

-  An integer number for distance. The maximum value is 32767.

OR

-  Ed.DISTANCE_UNLIMITED - turns on Edison's motors and moves on with
   the code. (Note: a stop will be needed later in the code.)

If using an integer number, note that the unit value of this number is
set by Ed.DistanceUnits in the setup code. You can change the unit value
by changing what Ed.DistanceUnits is set to in the setup code.

-  Ed.DistanceUnits = Ed.CM - distance in centimetres(default for V2.0).
-  Ed.DistanceUnits= Ed.INCH - distance in inches.
-  Ed.DistanceUnits = Ed.TIME - distance in milliseconds (default for
   V1).

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Controls Edison's left motor to create movement. This can be set to move
for a set distance (CM or INCH) or time period (TIME) and will drive the
full distance before moving onto the next line of code.

Examples:
~~~~~~~~~

Drive Edison's left motor forward for 3 cm at speed 5. (Edison V2.0
only)

::

   Ed.DistanceUnits = Ed.CM

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.DriveLeftMotor(Ed.FORWARD, Ed.SPEED_5, 3)

| Drive Edison's left motor forward for 5 inches at speed 5. (Edison
  V2.0 only)

::

   Ed.DistanceUnits = Ed.INCH

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.DriveLeftMotor(Ed.FORWARD, Ed.SPEED_5, 5)

Drive Edison's left motor forward for 2000 milliseconds at speed 7.

::

   Ed.DistanceUnits = Ed.TIME

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.DriveLeftMotor(Ed.FORWARD, Ed.SPEED_7, 2000)

Set speed and distance with variables.

::

   Ed.DistanceUnits = Ed.CM

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   driveSpeed=5

   driveDistance=10

   Ed.DriveLeftMotor(Ed.FORWARD, driveSpeed, driveDistance)

Watch out for:
~~~~~~~~~~~~~~

Distance units of CM and INCH are only available for Edison V2.0. If you
are using a V1 Edison, please make sure that Ed.DistanceUnits= Ed.TIME.

The Ed.TIME constant is in milliseconds. When Ed.DistanceUnits= Ed.TIME,
remember that the distance input integer is milliseconds. Example: to
drive for 2 seconds, a distance of 2000 should be input.

When Edison is turning and Ed.DistanceUnits is set to CM or INCH,
distance becomes the number of degrees to turn with a maximum value of
360. If you put in a value above 360, the code will wrap the value
around and Edison will perform a shorter turn. Example: an input of 380
will cause Edison to turn 20 degrees.

Ed.SPEED_FULL turns Edison's motors up to the maximum value. As such
Edison has no control over the speed and Edison V2.0s will not be able
to use their encoders to correct for driving drift.

Setting distance to 0 orEd.DISTANCE_UNLIMITED makes Edison turn on the
motors and move on with the code. An additional Ed.Drive() will be
required later in the code to stop or change the direction of movement.

When the distance input is set to anything other than 0
orEd.DISTANCE_UNLIMITED, Edison will drive for the full distance
supplied before moving on to the next line of code.

"""

def DriveRightMotor(direction,speed,distance):
    """Parameters:
~~~~~~~~~~~

Direction:
^^^^^^^^^^

-  Ed.FORWARD - Edison's right motor drives forwards.
-  Ed.BACKWARD - Edison's right motor drives backwards.
-  Ed.STOP - Stops Edison's right motor immediately.

Speed:
^^^^^^

-  A positive integer number between 1-10.
-  Ed.SPEED_1 - PWM controlled speed 1.
-  Ed.SPEED_2 - PWM controlled speed 2.
-  Ed.SPEED_3 - PWM controlled speed 3.
-  Ed.SPEED_4 - PWM controlled speed 4.
-  Ed.SPEED_5 - PWM controlled speed 5.
-  Ed.SPEED_6 - PWM controlled speed 6.
-  Ed.SPEED_7 - PWM controlled speed 7.
-  Ed.SPEED_8 - PWM controlled speed 8.
-  Ed.SPEED_9 - PWM controlled speed 9.
-  Ed.SPEED_10 - PWM controlled speed 10.
-  Ed.SPEED_FULL - Full power to the right motor. (Please note- Edison
   may not drive perfectly straight with this setting).

Distance:
^^^^^^^^^

-  An integer number for distance. The maximum value is 32767.

OR

-  Ed.DISTANCE_UNLIMITED - turns on Edison's motors and moves on with
   the code. (Note: a stop will be needed later in the code.)

If using an integer number, note that the unit value of this number is
set by Ed.DistanceUnits in the setup code. You can change the unit value
by changing what Ed.DistanceUnits is set to in the setup code.

-  Ed.DistanceUnits = Ed.CM - distance in centimetres(default for V2.0).
-  Ed.DistanceUnits= Ed.INCH - distance in inches.
-  Ed.DistanceUnits= Ed.TIME - distance in milliseconds(default for V1).

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Controls Edison's right motor to create movement. This can be set to
move for a set distance (CM or INCH) or time period (TIME) and will
drive the full distance before moving onto the next line of code.

Examples:
~~~~~~~~~

Drive Edison's right motor forward for 3 cm at speed 5. (Edison V2.0
only)

::

   Ed.DistanceUnits = Ed.CM

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.DriveRightMotor(Ed.FORWARD, Ed.SPEED_5, 3)

| Drive Edison's right motor forward for 5 inches at speed 5. (Edison
  V2.0 only)

::

   Ed.DistanceUnits = Ed.INCH

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.DriveRightMotor(Ed.FORWARD, Ed.SPEED_5, 5)

Drive Edison's right motor forward for 2000 milliseconds at speed 7.

::

   Ed.DistanceUnits = Ed.TIME

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   Ed.DriveRightMotor(Ed.FORWARD, Ed.SPEED_7, 2000)

Set speed and distance with variables.

::

   Ed.DistanceUnits = Ed.CM

   Ed.Tempo = Ed.TEMPO_MEDIUM

   #--------Your code below-----------

   driveSpeed=5

   driveDistance=10

   Ed.DriveRightMotor(Ed.FORWARD, driveSpeed, driveDistance)

Watch out for:
~~~~~~~~~~~~~~

Distance units of CM and INCH are only available for Edison V2.0. If you
are using a V1 Edison, please make sure that Ed.DistanceUnits= Ed.TIME.

The Ed.TIME constant is in milliseconds. When Ed.DistanceUnits= Ed.TIME,
remember that the distance input integer is milliseconds. Example: to
drive for 2 seconds, a distance of 2000 should be input.

When Edison is turning and Ed.DistanceUnits is set to CM or INCH,
distance becomes the number of degrees to turn with a maximum value of
360. If you put in a value above 360, the code will wrap the value
around and Edison will perform a shorter turn. Example: an input of 380
will cause Edison to turn 20 degrees.

Ed.SPEED_FULL turns Edison's motors up to the maximum value. As such
Edison has no control over the speed and Edison V2.0s will not be able
to use their encoders to correct for driving drift.

Setting distance to 0 orEd.DISTANCE_UNLIMITED makes Edison turn on the
motors and move on with the code. An additional Ed.Drive() will be
required later in the code to stop or change the direction of movement.

When the distance input is set to anything other than 0
orEd.DISTANCE_UNLIMITED, Edison will drive for the full distance
supplied before moving on to the next line of code.

"""

def ReadObstacleDetection():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.OBSTACLE_NONE - Edison cannot detect an obstacle.
-  Ed.OBSTACLE_RIGHT - Edison has detected an obstacle on the right.
-  Ed.OBSTACLE_LEFT - Edison has detected an obstacle on the left.
-  Ed.OBSTACLE_AHEAD - Edison has detected an obstacle straight ahead.

Explanation:
~~~~~~~~~~~~

Reads Edison's obstacle detection state, returning its value and then
clears EdisonÆs obstacle detection register. Ed.ObstacleDetectionBeam
needs to be set to ON for this function to return any value other than
Ed.OBSTACLE_NONE.

Examples:
~~~~~~~~~

Play a beep when any obstacle is detected.

::

   #--------Your code below-----------

   Ed.ObstacleDetectionBeam(Ed.ON)

   while True:

       if Ed.ReadObstacleDetection()>Ed.OBSTACLE_NONE:

           Ed.PlayBeep()

Drive until an obstacle is detected ahead.

::

   #--------Your code below-----------

   Ed.ObstacleDetectionBeam(Ed.ON)

   Ed.Drive(Ed.FORWARD, 5, Ed.DISTANCE_UNLIMITED)

   while Ed.ReadObstacleDetection() != Ed.OBSTACLE_AHEAD:

       pass

   Ed.Drive(Ed.STOP, 1, 1)

Wait 3 seconds, then clear the obstacle detection register before
looking for new obstacles to be detected and signalled with a beep.

::

   #--------Your code below-----------

   Ed.ObstacleDetectionBeam(Ed.ON)

   Ed.TimeWait(3, Ed.TIME_SECONDS)

   Ed.ReadObstacleDetection()

   while Ed.ReadObstacleDetection() != Ed.OBSTACLE_AHEAD:

       pass

   Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

Ed.ObstacleDetectionBeam needs to be set to Ed.ON for this function to
return any value other than Ed.OBSTACLE_NONE.

When the obstacle detection beam is set to ON, Edison is constantly
updating the obstacle detection state. This function will read the
state. As such, the function may read a detectionfrom before the read
function is called in your code.

The read function clears the obstacle detection state.

| When using a read function inside a loop, include a read function
  outside of the loop before the loop to clear any previous data.

"""

def ReadKeypad():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.KEYPAD_NONE - None of Edison's buttons have been pressed.
-  Ed.KEYPAD_TRIANGLE- Edison's triangle button has been pressed.
-  Ed.KEYPAD_ROUND - Edison's round button has been pressed.

Explanation:
~~~~~~~~~~~~

Reads Edison's keypad state, returning its value and then clears
EdisonÆs keypad register. Edison's keypad state will be set anytime a
button is pressed regardless of what the code is doing at the time.

Examples:
~~~~~~~~~

Play a beep when any button is pressed.

::

   #--------Your code below-----------

   while True:

       if Ed.ReadKeypad() != Ed.KEYPAD_NONE:

           Ed.PlayBeep()

Wait for the triangle button to be pressed, then beep.

::

   #--------Your code below-----------

   while Ed.ReadKeypad() != Ed.KEYPAD_TRIANGLE:

       pass

   Ed.PlayBeep()

Wait 3 seconds, then clear the keypad state before looking for a new
button press to be detected and signalled with a beep.

::

   #--------Your code below-----------

   Ed.TimeWait(3, Ed.TIME_SECONDS)

   Ed.ReadKeypad()

   while Ed.ReadKeypad() == Ed.KEYPAD_NONE:

       pass

   Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

Edison is constantly updating the keypad state. This function will read
the state. As such, the function may read a keypad pressfrom before the
read function is called in your code.

The read function clears the keypad state.

| When using a read function inside a loop, include a read function
  outside of the loop before the loop to clear any previous data.

"""

def ReadClapSensor():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.CLAP_NOT_DETECTED - Edison has not detected a clap.
-  Ed.CLAP_DETECTED - Edison has detected a clap.

Explanation:
~~~~~~~~~~~~

Reads Edison's clap detection state, returning its value and then clears
EdisonÆs clap detection register. Edison's clap detection state will be
set anytime a clap is detected regardless of what the code is doing at
the time.

Examples:
~~~~~~~~~

Flash an LED when a clap is detected.

::

   #--------Your code below-----------

   Ed.ObstacleDetectionBeam(Ed.ON)

   while True:

       if ReadClapSensor()==Ed.CLAP_DETECTED:

           Ed.LeftLed(Ed.ON)

           Ed.TimeWait(50, Ed.TIME_MILLISECONDS)

           Ed.LeftLed(Ed.OFF)

           Ed.TimeWait(50, Ed.TIME_MILLISECONDS)

Beep when a clap is detected after a drive.

::

   #--------Your code below-----------

   Ed.Drive(Ed.FORWARD, 5, 10)

   #wait a short time and clear the clap that was detected during the drive

   Ed.TimeWait(350, Ed.TIME_MILLISECONDS)

   ReadClapSensor()

   #wait for a new clap

   while ReadClapSensor() == Ed.CLAP_NOT_DETECTED:

       pass

   Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

Edison is constantly updating the clap detection state. This function
will read the state. As such, the function may read a clapfrom before
the read function is called in your code.

The read function clears the clap detection state.

When using a read function inside a loop, include a read function
outside of the loop before the loop to clear any previous data.

| Edison's motors cause noise which will be detected and registered as
  "claps" while Edison is in motion. Therefore, driving Edison will
  cause claps to be detected. Make sure that you clear the clap
  detection state after waiting a few milliseconds once the driving has
  finished before calling the function to detect a new clap event.

"""

def ReadLineState():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.LINE_ON_BLACK - Edison's line tracker is over a non-reflective
   surface.
-  Ed.LINE_ON_WHITE - Edison's line tracker is over a reflective
   surface.

Explanation:
~~~~~~~~~~~~

Reads the current line tracker status based on the reflected light from
the line tracking sensor.

Examples:
~~~~~~~~~

Play a beep when a black surface is detected.

::

   #--------Your code below-----------

   Ed.LineTrackerLed(Ed.ON)

   while True:

       if Ed.ReadLineState() == Ed.LINE_ON_BLACK:

           Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

Ed.LineTrackerLed() needs to be set to Ed.ON for this function to return
any value.

Edison sets the LINE_ON_WHITEstatus when the line tracking LED is turned
on and determines the LINE_ON_BLACK status by looking for a sharp drop
off in reflected light. If Edison is on a black line when the line
tracking LED is turned on, Edison will mistakenly reference that value
as LINE_ON_WHITE and will be unable to detect a sharp drop off to assign
LINE_ON_BLACK. This will cause an error where LINE_ON_BLACK remains
unset.

When the line tracker LED is ON, Edison is constantly updating the line
tracker state causing this function to continuously read the current
state of the line tracker.

"""

def ReadRemote():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.REMOTE_CODE_NONE - Edison has not received a remote code.
-  REMOTE_CODE_0 - Edison has received remote code 0.
-  REMOTE_CODE_1 - Edison has received remote code 1.
-  REMOTE_CODE_2 - Edison has received remote code 2.
-  REMOTE_CODE_3 - Edison has received remote code 3.
-  REMOTE_CODE_4 - Edison has received remote code 4.
-  REMOTE_CODE_5 - Edison has received remote code 5.
-  REMOTE_CODE_6 - Edison has received remote code 6.
-  REMOTE_CODE_7 - Edison has received remote code 7.

Explanation:
~~~~~~~~~~~~

Reads the last received remote control code and clears the remote
controlregister.

Examples:
~~~~~~~~~

Play a beep when each remote code is received in sequence.

::

   #--------Your code below-----------

   codes=Ed.List(8)

   codes[0]=Ed.REMOTE_CODE_0

   codes[1]=Ed.REMOTE_CODE_1

   codes[2]=Ed.REMOTE_CODE_2

   codes[3]=Ed.REMOTE_CODE_3

   codes[4]=Ed.REMOTE_CODE_4

   codes[5]=Ed.REMOTE_CODE_5

   codes[6]=Ed.REMOTE_CODE_6

   codes[7]=Ed.REMOTE_CODE_7


   for x in range(8):

       while Ed.ReadRemote() != codes[x]:

           pass

       Ed.PlayBeep()

       Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Drive forwards while remote code 1 is being received.

::

   #--------Your code below-----------

   while True:

       if Ed.ReadRemote() == Ed.REMOTE_CODE_1:

           Ed.Drive(Ed.FORWARD, 5, Ed.DISTANCE_UNLIMITED)

           Ed.TimeWait(300, Ed.TIME_MILLISECONDS)

       else:

           Ed.Drive(Ed.STOP, 1, 1)   

Watch out for:
~~~~~~~~~~~~~~

Edison can only react to remote control codes that have been saved into
the robotÆs memory using the barcodes provided. See
https://meetedison.com/robot-activities/youre-a-robot-programmer/remote-control-barcodes/
for the full list.

Edison robots use the same IR receiver to receive remote control codes,
IR data from other Edisons and perform obstacle detection. Therefore,
the Ed.ObstacleDetectionBeam needs to be OFF for a remote code to be
able to be received.

Edison is constantly updating the remote-control register. This function
will read the state. As such, the function may read a remote-control
call from before the read function is called in your code.

The read function clears the remote-control register.

| When using a read function inside a loop, include a read function
  outside of the loop before the loop to clear any previous data.

"""

def ReadIRData():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

Last received infrared data from another Edison.

Explanation:
~~~~~~~~~~~~

Reads the last received infrared data sent from another Edison robot.

Examples:
~~~~~~~~~

Play a beep when a 10 is received from another Edison.

::

   #--------Your code below-----------

   Ed.ReadIRData()

   while True:

       if Ed.ReadIRData()==10:

           Ed.PlayBeep()

           Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Edison robots use the same IR receiver to receive remote control codes,
IR data from other Edisons and perform obstacle detection. Therefore,
the Ed.ObstacleDetectionBeam needs to be OFF for data from other Edisons
to be able to be received.

Edison is constantly updating the data-received register. This function
will read the register. As such, the function may read data from before
the read function is called in your code.

The read function clears the data-received register.

| When using a read function inside a loop, include a read function
  outside of the loop before the loop to clear any previous data.

"""

def ReadLeftLightLevel():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

The current light level of the left light sensor.

Explanation:
~~~~~~~~~~~~

Reads the current light level of the left light sensor.

Examples:
~~~~~~~~~

Play a beep whenever the left light level reading is higher than the
right light level reading.

::

   #--------Your code below-----------

   while True:

       if Ed.ReadLeftLightLevel()>Ed.ReadRightLightLevel():

           Ed.PlayBeep()

           Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Edison reads the light level using an analogue to digital converter, so
the returned value can be between 0 and 1023.

"""

def ReadRightLightLevel():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

The current light level of the right light sensor.

Explanation:
~~~~~~~~~~~~

Reads the current light level of the right light sensor.

Examples:
~~~~~~~~~

Play a beep whenever the right light level reading is higher than the
left light level reading.

::

   #--------Your code below-----------
   while True:

       if Ed.ReadRightLightLevel()>Ed.ReadLeftLightLevel():

           Ed.PlayBeep()

           Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Edison reads the light level using an analogue to digital converter, so
the returned value can be between 0 and 1023.

"""

def ReadLineTracker():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

The current light level of the line tracking light sensor.

Explanation:
~~~~~~~~~~~~

Reads the current light level of the line tracking light sensor.

Examples:
~~~~~~~~~

Play a beep whenever the line tracking light level drops below a
threshold buffer value.

::

   #--------Your code below-----------

   Ed.LineTrackerLed(Ed.ON)

   white=Ed.ReadLineTracker()

   buffer=150

   while True:

       if Ed.ReadLineTracker()<(white-buffer):

           Ed.PlayBeep()

           Ed.TimeWait(1, Ed.TIME_SECONDS)

Watch out for:
~~~~~~~~~~~~~~

Edison reads the light level using an analogue to digital converter, so
the returned value can be between 0 and 1023.

This function can be used without turning the line tracking LED on,
however, values returned will be much lower and harder to distinguish.
Turning the line tracking LED on is highly recommended before using this
read function.

"""

def ReadCountDown(units):
    """Parameters:
~~~~~~~~~~~

Units:
^^^^^^

-  Ed.TIME_MILLISECONDS - Read the number of milliseconds left in the
   countdown timer.
-  Ed.TIME_SECONDS- Read the number of seconds left in the countdown
   timer.

Returns:
~~~~~~~~

The number of seconds or milliseconds left on the countdown timer.

Explanation:
~~~~~~~~~~~~

Reads the number of seconds or milliseconds left on the countdown timer.

Examples:
~~~~~~~~~

Flash the left LED for 3000 milliseconds.

::

   Ed.StartCountDown(3100, Ed.TIME_MILLISECONDS)

   while Ed.ReadCountDown(Ed.TIME_MILLISECONDS) > 100:

       Ed.LeftLed(Ed.ON)

       Ed.TimeWait(50, Ed.TIME_MILLISECONDS)

       Ed.LeftLed(Ed.OFF)

       Ed.TimeWait(50, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

The timer can ONLY count down, not up. It cannot be used as a stopwatch
counting up, only as a timer counting down.

The timer is not a clock and cannot tell time.

| When reading the timer in seconds, the read function will return an
  integer value, not a float value. Therefore,
  Ed.ReadCountDown(Ed.TIME_SECONDS) will return 0 if the time left in
  the countdown is less than 1 second (e.g. 0.8 seconds). Consider using
  milliseconds if working with values smaller than whole seconds.

"""

def ReadMusicEnd():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  Ed.MUSIC_FINISHED - Edison has finished playing the tune, tone or
   beep.
-  MUSIC_NOT_FINISHED - Edison is still playing tune, tone or beep.

Explanation:
~~~~~~~~~~~~

Reads the current state of the sound being played from Edison's buzzer.

Examples:
~~~~~~~~~

Play a simple tune.

::

   #--------Your code below-----------

   simple = Ed.TuneString(25, "d4e4f4e4d4c4n2d4e4f4e4d1z")

   Ed.PlayTune(simple)

   while Ed.ReadMusicEnd()==Ed.MUSIC_NOT_FINISHED:

        pass

Watch out for:
~~~~~~~~~~~~~~

All tunes need to end with a "z" character to end correctly.

All of Edison's sounds occur in the background, as such, Edison moves
onto the next line of code as soon as the sound starts. To make Edison
wait for the sound to finish use the Ed.ReadMusicEnd() function in a
loop.

| You can change the speed you tune plays by changing the Ed.Tempo in
  the setup.

"""

def ReadDriveLoad():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

-  DRIVE_NO_STRAIN - Edison's wheels are turning correctly.
-  DRIVE_STRAINED - Edison's wheels are not turning.

Explanation:
~~~~~~~~~~~~

Reads the current state of Edison's drive strain.

Examples:
~~~~~~~~~

Drive until Edison detects drive strain.

::

   #--------Your code below-----------

   Ed.Drive(Ed.FORWARD, 5, Ed.DISTANCE_UNLIMITED)

   while Ed.ReadDriveLoad()==Ed.DRIVE_NO_STRAIN:

       pass

   Ed.Drive(Ed.STOP, 1, 1)

Watch out for:
~~~~~~~~~~~~~~

When driving using both wheels, detected strain on either wheel will
trigger the DRIVE_STRAINED condition. When driving using only a single
wheel, only strain detected on the moving wheel will trigger the
DRIVE_STRAINEDcondition.

"""

def ReadDistance(side):
    """Parameters:
~~~~~~~~~~~

Side:
^^^^^

-  Ed.MOTOR_LEFT - The number of ticks remaining on the left distance
   register.
-  Ed.MOTOR_RIGHT- The number of ticks remaining on the right distance
   register.

Returns:
~~~~~~~~

The number of ticks remaining on the left or right distance register.

Explanation:
~~~~~~~~~~~~

Reads the number of ticks remaining on the left or right distance
register.

Examples:
~~~~~~~~~

Drive for 40 ticks, then beep.

::

   #--------Your code below-----------

   Ed.Drive(Ed.FORWARD, 5, 0)

   Ed.SetDistance(Ed.MOTOR_LEFT, 40)

   Ed.SetDistance(Ed.MOTOR_RIGHT, 40)

   while Ed.ReadDistance(Ed.MOTOR_LEFT)>0:

       pass
           
   Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

This function is only compatible with Edison V2.0 robots.

The function reads values in ticks, where a tick is 1.25mm.

| This read function needs to be used with the Ed.SetDistance()
  function.

"""

def SetDistance(side, ticks):
    """Parameters:
~~~~~~~~~~~

Side:
^^^^^

-  Ed.MOTOR_LEFT - set the number of ticks in the left distance
   register.
-  Ed.MOTOR_RIGHT- set the number of ticks in the right distance
   register.

Ticks:
^^^^^^

A positive integer number of ticks to set the distance register to. The
maximum value is 32767. [Note: A tick is one-quarter revolution of an
Edison V2.0 robot's encoder wheel and equates to 1.25mm of travel.]

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Sets one of the Edison V2.0 robot's distance registers, turning an
unlimited drive back into a distance limited drive. Allows access to the
distance registers in ticks (Edison's internal distance measurement).

Examples:
~~~~~~~~~

Drive for 40 ticks, then beep.

::

   #--------Your code below-----------

   Ed.Drive(Ed.FORWARD, 5, 0)

   Ed.SetDistance(Ed.MOTOR_LEFT, 40)

   Ed.SetDistance(Ed.MOTOR_RIGHT, 40)

   while Ed.ReadDistance(Ed.MOTOR_LEFT)>0:

       pass
           
   Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

This function is only compatible with Edison V2.0.

The function reads values in ticks, where a tick is 1.25mm.

"""

def ResetDistance():
    """Parameters:
~~~~~~~~~~~

N/A

Returns:
~~~~~~~~

N/A

Explanation:
~~~~~~~~~~~~

Resets the number of ticks remaining on both the left and right distance
registers to zero.

Examples:
~~~~~~~~~

Drive for 40 ticks or until an obstacle is encountered, then beep.

::

   #--------Your code below-----------

   Ed.ObstacleDetectionBeam(Ed.ON)

   Ed.Drive(Ed.FORWARD, 5, 0)

   Ed.SetDistance(Ed.MOTOR_LEFT, 40)

   Ed.SetDistance(Ed.MOTOR_RIGHT, 40)

   while Ed.ReadDistance(Ed.MOTOR_LEFT)>0:

       if Ed.ReadObstacleDetection()>Ed.OBSTACLE_NONE:

           Ed.ResetDistance()
           
   Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

This function is only compatible with Edison V2.0 robots.

This function reads values in ticks, where a tick is 1.25mm.

"""

def abs(int):
    """Parameters:
~~~~~~~~~~~

int:
^^^^

An integer value between +/- 32767

Returns:
~~~~~~~~

The mathematical absolute value of the input.

Explanation:
~~~~~~~~~~~~

Flips the sign of any negative number input, returning a positive number
without changing the absolute value.

Examples:
~~~~~~~~~

Change negative 30 to positive 30 and check by beeping.

::

   #--------Your code below-----------
   x=-30

   x=abs(x)

   if x==30:

       Ed.PlayBeep()

Watch out for:
~~~~~~~~~~~~~~

abs() is a native python function. As such, it does not need the "Ed."
prefix.

"""

def len(list):
    """Parameters:
~~~~~~~~~~~

List:
^^^^^

An EdPy list.

Returns:
~~~~~~~~

The number of elements in the EdPy list.

Explanation:
~~~~~~~~~~~~

Returns the maximum number of integers that can be stored in the given
list.

Examples:
~~~~~~~~~

Loop through a created list and beep when a 2 is found.

::

   #--------Your code below-----------

   exampleList = Ed.List(6,[1,2,3,3,2,1])

   listSize=len(exampleList)

   for x in range(listSize):

       if exampleList[x]==2:

           Ed.PlayBeep()

           Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

len() returns the value you entered as the size of the list when it was
created, even if you have not assigned values to all of the integers.

"""

def range(limit):
    """Parameters:
~~~~~~~~~~~

Limit:
^^^^^^

The value to count up to.

Returns:
~~~~~~~~

The values from 0 to the limit in sequence.

Explanation:
~~~~~~~~~~~~

Controls the number of times the code loops around. Only valid in "for"
loops.

Produces values of 0 to limit minus 1 (i.e. limit - 1) for a ôforö loop.

Examples:
~~~~~~~~~

Loop through a created list and beep when a 2 is found.

::

   #--------Your code below-----------

   exampleList = Ed.List(6,[1,2,3,3,2,1])

   listSize=len(exampleList)

   for x in range(listSize):

       if exampleList[x]==2:

           Ed.PlayBeep()

           Ed.TimeWait(500, Ed.TIME_MILLISECONDS)

Watch out for:
~~~~~~~~~~~~~~

Limit makes a for loop count up from zero, up to one value under the
limit. The for loop does not use the number entered as the limit.

"""

