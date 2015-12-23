set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.5856, <2> 22.6109, <3> 29.9539, <4> 28.3249, <5> 19.9322, <6> 29.1731, <7> 21.5895, <8> 30.6009, <9> 26.0355, <10> 33.6673, <11> 17.4544, <12> 33.2752, <13> 31.5718, <14> 31.4373, <15> 29.8216, <16> 17.8441, <17> 30.5539, <18> 28.5828, <19> 29.9647, <20> 31.8731;
param workload[JOB] := <1> 5.0582, <2> 4.7551, <3> 5.473, <4> 5.3221, <5> 4.4645, <6> 5.4012, <7> 4.6465, <8> 5.5318, <9> 5.1025, <10> 5.8024, <11> 4.1778, <12> 5.7685, <13> 5.6189, <14> 5.6069, <15> 5.4609, <16> 4.2242, <17> 5.5276, <18> 5.3463, <19> 5.474, <20> 5.6456;
param capacity[MACHINE] := <1> 14.9154, <2> 14.9154, <3> 14.9154, <4> 14.9154, <5> 14.9154, <6> 14.9154, <7> 14.9154;

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
