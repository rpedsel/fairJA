set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7524, <2> 19.7931, <3> 23.749, <4> 26.7519, <5> 32.9759, <6> 25.5554, <7> 30.8787, <8> 26.0193, <9> 18.2826, <10> 29.1331, <11> 16.8296, <12> 20.5297, <13> 21.4883, <14> 27.6412, <15> 27.4712, <16> 22.7093, <17> 28.7876, <18> 25.1674, <19> 16.3724, <20> 33.4267;
param workload[JOB] := <1> 25.7524, <2> 19.7931, <3> 23.749, <4> 26.7519, <5> 32.9759, <6> 25.5554, <7> 30.8787, <8> 26.0193, <9> 18.2826, <10> 29.1331, <11> 16.8296, <12> 20.5297, <13> 21.4883, <14> 27.6412, <15> 27.4712, <16> 22.7093, <17> 28.7876, <18> 25.1674, <19> 16.3724, <20> 33.4267;
param capacity[MACHINE] := <1> 499.3148, <2> 499.3148, <3> 499.3148, <4> 499.3148, <5> 499.3148, <6> 499.3148, <7> 499.3148;

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
