set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.538, <2> 19.8516, <3> 19.5374, <4> 17.6159, <5> 30.9025, <6> 27.8544, <7> 33.4582, <8> 25.5006, <9> 18.5238, <10> 21.6298, <11> 26.1726, <12> 28.2143, <13> 27.4166, <14> 24.6161, <15> 26.776, <16> 22.9935, <17> 15.0244, <18> 24.7726, <19> 19.0722, <20> 19.6984;
param workload[JOB] := <1> 6.445, <2> 4.4555, <3> 4.4201, <4> 4.1971, <5> 5.559, <6> 5.2777, <7> 5.7843, <8> 5.0498, <9> 4.3039, <10> 4.6508, <11> 5.1159, <12> 5.3117, <13> 5.2361, <14> 4.9615, <15> 5.1746, <16> 4.7952, <17> 3.8761, <18> 4.9772, <19> 4.3672, <20> 4.4383;
param capacity[MACHINE] := <1> 98.397, <2> 98.397, <3> 98.397, <4> 98.397, <5> 98.397, <6> 98.397;

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
