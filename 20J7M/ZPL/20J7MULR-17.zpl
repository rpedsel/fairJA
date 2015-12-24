set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.7521, <2> 18.755, <3> 3.7603, <4> 24.8506, <5> 33.5612, <6> 42.4911, <7> 34.7122, <8> 19.1955, <9> 40.273, <10> 30.7858, <11> 43.387, <12> 11.1616, <13> 46.6546, <14> 20.0764, <15> 41.5258, <16> 5.3067, <17> 40.0415, <18> 7.135, <19> 6.2001, <20> 10.9805;
param workload[JOB] := <1> 49.3078, <2> 13.8442, <3> 49.3322, <4> 11.7741, <5> 40.9582, <6> 41.0619, <7> 46.5432, <8> 5.6527, <9> 41.0099, <10> 4.8452, <11> 43.4037, <12> 18.1104, <13> 40.2178, <14> 35.3835, <15> 21.1324, <16> 23.6049, <17> 7.958, <18> 45.9557, <19> 30.7401, <20> 49.4378;
param capacity[MACHINE] := <1> 88.6105, <2> 88.6105, <3> 88.6105, <4> 88.6105, <5> 88.6105, <6> 88.6105, <7> 88.6105;

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
