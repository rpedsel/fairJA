set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.043, <2> 14.1052, <3> 4.6045, <4> 12.6596, <5> 39.4929, <6> 25.1988, <7> 43.2377, <8> 29.5199, <9> 28.8261, <10> 49.231, <11> 48.7632, <12> 5.4457, <13> 20.4519, <14> 1.6572, <15> 1.6654, <16> 25.0563, <17> 16.4917, <18> 49.0999, <19> 36.9402, <20> 0.4269;
param workload[JOB] := <1> 3.0072, <2> 3.7557, <3> 2.1458, <4> 3.558, <5> 6.2843, <6> 5.0198, <7> 6.5755, <8> 5.4332, <9> 5.369, <10> 7.0165, <11> 6.9831, <12> 2.3336, <13> 4.5224, <14> 1.2873, <15> 1.2905, <16> 5.0056, <17> 4.061, <18> 7.0071, <19> 6.0778, <20> 0.6534;
param capacity[MACHINE] := <1> 87.3868, <2> 87.3868, <3> 87.3868, <4> 87.3868, <5> 87.3868, <6> 87.3868, <7> 87.3868;

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
