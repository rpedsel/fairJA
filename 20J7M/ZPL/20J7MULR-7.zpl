set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.1967, <2> 48.0599, <3> 44.755, <4> 17.2657, <5> 8.7922, <6> 41.2928, <7> 32.82, <8> 26.1004, <9> 21.2727, <10> 3.6047, <11> 40.9242, <12> 8.8284, <13> 0.8856, <14> 45.1724, <15> 46.5992, <16> 13.0839, <17> 46.8729, <18> 44.5081, <19> 22.4053, <20> 31.4664;
param workload[JOB] := <1> 5.5873, <2> 40.0352, <3> 1.4819, <4> 27.1552, <5> 8.8937, <6> 1.5331, <7> 13.1558, <8> 22.6423, <9> 22.8475, <10> 18.6575, <11> 4.5657, <12> 37.025, <13> 24.5754, <14> 26.2478, <15> 21.7212, <16> 34.6531, <17> 32.37, <18> 40.9505, <19> 28.7434, <20> 3.7963;
param capacity[MACHINE] := <1> 59.5197, <2> 59.5197, <3> 59.5197, <4> 59.5197, <5> 59.5197, <6> 59.5197, <7> 59.5197;

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
