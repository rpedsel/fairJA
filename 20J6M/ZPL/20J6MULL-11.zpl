set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.192, <2> 12.1887, <3> 0.7434, <4> 33.3106, <5> 40.4879, <6> 27.5427, <7> 10.1391, <8> 6.3666, <9> 47.1411, <10> 17.9407, <11> 14.982, <12> 28.8283, <13> 35.6257, <14> 42.4256, <15> 11.6572, <16> 33.8131, <17> 29.0966, <18> 45.8257, <19> 11.4992, <20> 42.5777;
param workload[JOB] := <1> 4.192, <2> 12.1887, <3> 0.7434, <4> 33.3106, <5> 40.4879, <6> 27.5427, <7> 10.1391, <8> 6.3666, <9> 47.1411, <10> 17.9407, <11> 14.982, <12> 28.8283, <13> 35.6257, <14> 42.4256, <15> 11.6572, <16> 33.8131, <17> 29.0966, <18> 45.8257, <19> 11.4992, <20> 42.5777;
param capacity[MACHINE] := <1> 82.7306, <2> 82.7306, <3> 82.7306, <4> 82.7306, <5> 82.7306, <6> 82.7306;

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
