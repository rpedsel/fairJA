set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.5289, <2> 26.5901, <3> 25.1854, <4> 17.0957, <5> 29.1918, <6> 15.3803, <7> 25.3612, <8> 22.2211, <9> 25.4297, <10> 14.0621;
param workload[JOB] := <1> 5.7034, <2> 5.1566, <3> 5.0185, <4> 4.1347, <5> 5.4029, <6> 3.9218, <7> 5.036, <8> 4.7139, <9> 5.0428, <10> 3.7499;
param capacity[MACHINE] := <1> 11.9702, <2> 11.9702, <3> 11.9702;

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
