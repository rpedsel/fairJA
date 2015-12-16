set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.4861, <2> 19.8694, <3> 3.929, <4> 43.4424, <5> 15.1497, <6> 8.9915, <7> 47.9702, <8> 13.9627, <9> 3.8635, <10> 5.4379, <11> 25.5277, <12> 49.553, <13> 37.3216, <14> 31.7839, <15> 6.0412, <16> 28.2766, <17> 42.1904, <18> 38.1936, <19> 32.6283, <20> 31.9068;
param workload[JOB] := <1> 37.2796, <2> 26.9322, <3> 21.8434, <4> 30.0535, <5> 14.8519, <6> 39.707, <7> 19.526, <8> 0.7496, <9> 36.9545, <10> 6.0037, <11> 2.7586, <12> 7.5683, <13> 40.0175, <14> 13.0087, <15> 20.4764, <16> 31.9649, <17> 32.7979, <18> 35.9712, <19> 25.9699, <20> 35.2671;
param capacity[MACHINE] := <1> 479.7019, <2> 479.7019, <3> 479.7019, <4> 479.7019, <5> 479.7019, <6> 479.7019;

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
