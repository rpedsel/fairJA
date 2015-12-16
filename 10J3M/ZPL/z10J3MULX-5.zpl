set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.4712, <2> 17.8817, <3> 48.462, <4> 37.6619, <5> 22.0451, <6> 17.7621, <7> 8.2251, <8> 3.9699, <9> 25.6029, <10> 14.0534;
param workload[JOB] := <1> 7.0336, <2> 4.2287, <3> 6.9615, <4> 6.1369, <5> 4.6952, <6> 4.2145, <7> 2.8679, <8> 1.9925, <9> 5.0599, <10> 3.7488;
param capacity[MACHINE] := <1> 15.6465, <2> 15.6465, <3> 15.6465;

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
