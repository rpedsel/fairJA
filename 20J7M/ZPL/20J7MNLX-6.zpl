set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5194, <2> 22.7061, <3> 31.7859, <4> 22.0499, <5> 15.0888, <6> 29.9101, <7> 26.4638, <8> 23.3222, <9> 38.428, <10> 21.5538, <11> 25.9168, <12> 29.1797, <13> 25.131, <14> 27.812, <15> 28.6496, <16> 28.4849, <17> 16.975, <18> 19.6646, <19> 28.3519, <20> 31.8263;
param workload[JOB] := <1> 4.8497, <2> 4.7651, <3> 5.6379, <4> 4.6957, <5> 3.8844, <6> 5.469, <7> 5.1443, <8> 4.8293, <9> 6.199, <10> 4.6426, <11> 5.0909, <12> 5.4018, <13> 5.0131, <14> 5.2737, <15> 5.3525, <16> 5.3371, <17> 4.1201, <18> 4.4345, <19> 5.3247, <20> 5.6415;
param capacity[MACHINE] := <1> 14.4438, <2> 14.4438, <3> 14.4438, <4> 14.4438, <5> 14.4438, <6> 14.4438, <7> 14.4438;

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
