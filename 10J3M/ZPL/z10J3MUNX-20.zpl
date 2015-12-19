set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.2575, <2> 14.9277, <3> 42.4579, <4> 26.9714, <5> 36.1784, <6> 49.2884, <7> 6.5541, <8> 6.1557, <9> 18.9922, <10> 32.423;
param workload[JOB] := <1> 4.1542, <2> 3.8636, <3> 6.516, <4> 5.1934, <5> 6.0148, <6> 7.0206, <7> 2.5601, <8> 2.4811, <9> 4.358, <10> 5.6941;
param capacity[MACHINE] := <1> 47.8559, <2> 47.8559, <3> 47.8559;

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
