set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3802, <2> 21.023, <3> 28.0002, <4> 27.3709, <5> 21.3207, <6> 26.7375, <7> 30.8283, <8> 26.371, <9> 35.638, <10> 21.1879, <11> 43.6906, <12> 27.4305, <13> 21.7249, <14> 24.5589, <15> 26.2163, <16> 30.5207, <17> 32.1934, <18> 22.6116, <19> 29.3323, <20> 22.5434;
param workload[JOB] := <1> 33.323, <2> 24.5399, <3> 3.934, <4> 8.5342, <5> 6.8542, <6> 37.0968, <7> 16.523, <8> 35.7979, <9> 25.8731, <10> 23.9882, <11> 48.0863, <12> 23.88, <13> 19.5263, <14> 3.0766, <15> 49.6338, <16> 42.6907, <17> 19.5947, <18> 15.1655, <19> 28.6456, <20> 34.2707;
param capacity[MACHINE] := <1> 71.5764, <2> 71.5764, <3> 71.5764, <4> 71.5764, <5> 71.5764, <6> 71.5764, <7> 71.5764;

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
