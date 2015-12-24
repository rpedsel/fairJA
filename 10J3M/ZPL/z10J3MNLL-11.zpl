set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.7679, <2> 25.3891, <3> 27.9183, <4> 29.9203, <5> 34.2675, <6> 30.7033, <7> 26.4028, <8> 25.8566, <9> 11.3895, <10> 24.7572;
param workload[JOB] := <1> 21.7679, <2> 25.3891, <3> 27.9183, <4> 29.9203, <5> 34.2675, <6> 30.7033, <7> 26.4028, <8> 25.8566, <9> 11.3895, <10> 24.7572;
param capacity[MACHINE] := <1> 86.1242, <2> 86.1242, <3> 86.1242;

var x[JM] binary;
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
