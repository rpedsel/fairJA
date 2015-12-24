set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6028, <2> 29.019, <3> 35.0006, <4> 29.4278, <5> 25.9808, <6> 31.1215, <7> 22.244, <8> 23.8037, <9> 16.7526, <10> 31.1913, <11> 25.4542, <12> 23.056, <13> 27.826, <14> 25.3293, <15> 32.4467, <16> 20.4365, <17> 25.6917, <18> 22.7434, <19> 38.9353, <20> 31.251;
param workload[JOB] := <1> 5.1578, <2> 5.3869, <3> 5.9161, <4> 5.4247, <5> 5.0971, <6> 5.5787, <7> 4.7164, <8> 4.8789, <9> 4.093, <10> 5.5849, <11> 5.0452, <12> 4.8017, <13> 5.275, <14> 5.0328, <15> 5.6962, <16> 4.5207, <17> 5.0687, <18> 4.769, <19> 6.2398, <20> 5.5903;
param capacity[MACHINE] := <1> 14.8391, <2> 14.8391, <3> 14.8391, <4> 14.8391, <5> 14.8391, <6> 14.8391, <7> 14.8391;

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
