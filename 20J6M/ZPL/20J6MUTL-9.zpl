set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.439, <2> 14.8699, <3> 16.2861, <4> 34.9886, <5> 29.8515, <6> 16.5682, <7> 49.4267, <8> 47.7121, <9> 14.6193, <10> 8.9198, <11> 44.4365, <12> 38.8582, <13> 21.2165, <14> 3.4504, <15> 3.9769, <16> 12.5128, <17> 34.1644, <18> 11.5974, <19> 1.0332, <20> 1.6581;
param workload[JOB] := <1> 25.439, <2> 14.8699, <3> 16.2861, <4> 34.9886, <5> 29.8515, <6> 16.5682, <7> 49.4267, <8> 47.7121, <9> 14.6193, <10> 8.9198, <11> 44.4365, <12> 38.8582, <13> 21.2165, <14> 3.4504, <15> 3.9769, <16> 12.5128, <17> 34.1644, <18> 11.5974, <19> 1.0332, <20> 1.6581;
param capacity[MACHINE] := <1> 53.9482, <2> 53.9482, <3> 53.9482, <4> 53.9482, <5> 53.9482, <6> 53.9482;

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
