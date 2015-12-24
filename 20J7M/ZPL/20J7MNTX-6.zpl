set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.081, <2> 27.8924, <3> 27.8928, <4> 24.263, <5> 26.2378, <6> 26.1512, <7> 25.1572, <8> 24.3358, <9> 15.5714, <10> 37.1962, <11> 25.5044, <12> 25.8452, <13> 23.4862, <14> 22.6157, <15> 22.9609, <16> 23.1562, <17> 22.8512, <18> 26.6497, <19> 23.1678, <20> 16.8824;
param workload[JOB] := <1> 5.3927, <2> 5.2813, <3> 5.2814, <4> 4.9257, <5> 5.1223, <6> 5.1138, <7> 5.0157, <8> 4.9331, <9> 3.9461, <10> 6.0989, <11> 5.0502, <12> 5.0838, <13> 4.8463, <14> 4.7556, <15> 4.7918, <16> 4.8121, <17> 4.7803, <18> 5.1623, <19> 4.8133, <20> 4.1088;
param capacity[MACHINE] := <1> 10.6409, <2> 10.6409, <3> 10.6409, <4> 10.6409, <5> 10.6409, <6> 10.6409, <7> 10.6409;

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
