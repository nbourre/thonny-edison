VERSION 6, 0
DEVICE tracker, 0, LINE_TRACKER1
DEVICE led, 1, Right_LED
DEVICE motor-a, 3, Right_Motor
DEVICE irrx, 5, IR_RECEIVER1
DEVICE beeper, 6, SOUNDER1
DEVICE irtx, 7, IR_TRANSMITTER1
DEVICE motor-b, 8, Left_Motor
DEVICE led, 11, Left_LED
BEGIN MAIN
DATW _CALC 0 1
DATW Ed.EdisonVersion 1 1 2
DATW Ed.DistanceUnits 2 1 0
DATW Ed.Tempo 3 1 250
stinc $2

# FUNCTION:__main__
::_fun___main__
# Set intial tempo
movw $250 %68
# CALL:<program.Call name:Ed.LineTrackerLed with args:[<program.Value const:1>]>
stinc $2
movw $1 %_cpu:acc
stwaw $0
suba ::_fun_Ed.LineTrackerLed
stdec $2
# CTRL_MARKER:<program.ControlMarker marker:0 While start>
:_Control_0_start
# LOOP_CTRL:<program.LoopControl 0, name:While, test:<program.Value const:1>>
movw $1 %_cpu:acc
brz :_Control_0_else
# CTRL_MARKER:<program.ControlMarker marker:1 If start>
:_Control_1_start
# CALL:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadLineState with args:[]>
stinc $2
suba ::_fun_Ed.ReadLineState
straw $0
stwaw $2
stdec $2
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> Eq <program.Value const:0>>
straw $0
cmpw $0
brne :_int_0000
movw $1 %_cpu:acc
bra :_int_0001
:_int_0000
movw $0 %_cpu:acc
:_int_0001
# OPTIMISED OUT (STACK_WRITE): stwaw $1
# LOOP_CTRL:<program.LoopControl 1, name:If, test:<program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $1
brz :_Control_1_else
# Inline function for Ed.Drive_INLINE_UNLIMITED:<program.Call name:Ed.Drive_INLINE_UNLIMITED with args:[<program.Value const:3>, <program.Value const:1>, <program.Value const:0>]>
movb $129 %81
movb $192 %31
# CTRL_MARKER:<program.ControlMarker marker:1 If else>
bra :_Control_1_end
:_Control_1_else
# Inline function for Ed.Drive_INLINE_UNLIMITED:<program.Call name:Ed.Drive_INLINE_UNLIMITED with args:[<program.Value const:5>, <program.Value const:1>, <program.Value const:0>]>
movb $192 %81
movb $129 %31
# CTRL_MARKER:<program.ControlMarker marker:1 If end>
:_Control_1_end
# CTRL_MARKER:<program.ControlMarker marker:0 While end>
bra :_Control_0_start
:_Control_0_else
:_Control_0_end
stop
:_end___main__

# FUNCTION:Ed.LineTrackerLed
::_fun_Ed.LineTrackerLed
# BAssign:<program.BAssign <program.Value name:TEMP-0> = <program.Value name:value> BitAnd <program.Value const:1>>
straw $3
andw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# UAssign:<program.UAssign <program.Value name:value> = UAdd <program.Value name:TEMP-0>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
# Ed.WriteModuleRegister8Bit:<program.Call name:Ed.WriteModuleRegister8Bit with args:[<program.Value const:0>, <program.Value const:1>, <program.Value name:value>]>
# OPTIMISED OUT (STACK_READ): straw $3
conv
movb %_cpu:acc %01
ret
:_end_Ed.LineTrackerLed

# FUNCTION:Ed.ReadLineState
::_fun_Ed.ReadLineState
# Ed.ReadModuleRegister8Bit:<program.Call <program.Value name:TEMP-0> = name:Ed.ReadModuleRegister8Bit with args:[<program.Value const:0>, <program.Value const:0>]>
movb %00 %_cpu:acc
conv
stwaw $3
# BAssign:<program.BAssign <program.Value name:TEMP-1> = <program.Value name:TEMP-0> BitAnd <program.Value const:1>>
# OPTIMISED OUT (STACK_READ): straw $3
andw $1
# OPTIMISED OUT (STACK_WRITE): stwaw $4
# RETURN:<program.Return <program.Value name:TEMP-1>>
# OPTIMISED OUT (STACK_READ): straw $4
stwaw $3
ret
# OPTIMISED OUT (DBL-RET): ret
:_end_Ed.ReadLineState
stop
END MAIN
FINISH
