set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.0876, <2> 26.5882, <3> 26.8628, <4> 26.5316, <5> 20.7631, <6> 20.075, <7> 28.844, <8> 26.1411, <9> 24.4964, <10> 21.169;
param workload[JOB] := <1> 327.1613, <2> 706.9324, <3> 721.61, <4> 703.9258, <5> 431.1063, <6> 403.0056, <7> 831.9763, <8> 683.3571, <9> 600.0736, <10> 448.1266;
param capacity[MACHINE] := <1> 1952.425, <2> 1952.425, <3> 1952.425;

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
