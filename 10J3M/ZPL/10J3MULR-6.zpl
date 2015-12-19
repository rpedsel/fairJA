set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.2905, <2> 16.5557, <3> 7.7813, <4> 43.8216, <5> 11.8746, <6> 20.8435, <7> 43.1155, <8> 28.6822, <9> 23.1829, <10> 45.7284;
param workload[JOB] := <1> 25.5454, <2> 9.7986, <3> 32.8427, <4> 39.0683, <5> 32.4491, <6> 46.1312, <7> 4.1825, <8> 12.073, <9> 37.7232, <10> 11.1315;
param capacity[MACHINE] := <1> 83.6485, <2> 83.6485, <3> 83.6485;

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
