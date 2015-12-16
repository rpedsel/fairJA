set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8593, <2> 36.2731, <3> 30.9919, <4> 15.1595, <5> 25.075, <6> 19.1932, <7> 28.0699, <8> 13.0033, <9> 22.2291, <10> 25.1682;
param workload[JOB] := <1> 7.1889, <2> 9.3532, <3> 9.9291, <4> 35.9314, <5> 28.2871, <6> 27.5017, <7> 42.7506, <8> 10.0927, <9> 46.123, <10> 24.436;
param capacity[MACHINE] := <1> 80.5312, <2> 80.5312, <3> 80.5312;

var x[JM];
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
