set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.0048, <2> 30.0829, <3> 42.1226, <4> 2.2132, <5> 46.5497, <6> 28.1137, <7> 7.7441, <8> 32.3044, <9> 34.9852, <10> 12.2415, <11> 24.6659, <12> 1.0802, <13> 17.9779, <14> 17.4477, <15> 0.3563, <16> 23.233, <17> 4.0963, <18> 21.1942, <19> 15.4331, <20> 28.2281;
param workload[JOB] := <1> 46.0339, <2> 7.3068, <3> 47.212, <4> 39.4136, <5> 17.9687, <6> 5.344, <7> 18.2243, <8> 12.7105, <9> 45.8975, <10> 15.7499, <11> 15.2688, <12> 3.9396, <13> 21.3266, <14> 32.4786, <15> 45.1018, <16> 16.5246, <17> 43.6695, <18> 14.9436, <19> 7.3727, <20> 40.5182;
param capacity[MACHINE] := <1> 71.0007, <2> 71.0007, <3> 71.0007, <4> 71.0007, <5> 71.0007, <6> 71.0007, <7> 71.0007;

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
