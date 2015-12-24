set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.5777, <2> 44.3006, <3> 45.5647, <4> 38.8128, <5> 29.4942, <6> 10.8463, <7> 48.7531, <8> 7.6794, <9> 22.1723, <10> 16.0019;
param workload[JOB] := <1> 5.9647, <2> 6.6559, <3> 6.7502, <4> 6.23, <5> 5.4309, <6> 3.2934, <7> 6.9823, <8> 2.7712, <9> 4.7087, <10> 4.0002;
param capacity[MACHINE] := <1> 13.1969, <2> 13.1969, <3> 13.1969;

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
