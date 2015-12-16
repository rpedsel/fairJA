set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.8312, <2> 28.0036, <3> 30.8159, <4> 23.1413, <5> 29.5598, <6> 20.0382, <7> 34.2835, <8> 24.3415, <9> 19.7897, <10> 19.2185;
param workload[JOB] := <1> 34.3677, <2> 20.2237, <3> 14.6075, <4> 4.4731, <5> 20.2017, <6> 17.6978, <7> 44.8465, <8> 18.7715, <9> 25.4109, <10> 8.2974;
param capacity[MACHINE] := <1> 52.2244, <2> 52.2244, <3> 52.2244;

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
