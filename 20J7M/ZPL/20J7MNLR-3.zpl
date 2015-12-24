set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0712, <2> 21.8462, <3> 16.559, <4> 29.6045, <5> 35.6072, <6> 26.6337, <7> 30.9096, <8> 23.776, <9> 25.8809, <10> 36.5451, <11> 22.1273, <12> 29.8223, <13> 34.548, <14> 23.1153, <15> 27.9002, <16> 24.5701, <17> 39.5599, <18> 10.5262, <19> 28.3688, <20> 24.98;
param workload[JOB] := <1> 1.2287, <2> 29.882, <3> 39.2263, <4> 49.6868, <5> 10.3132, <6> 49.5878, <7> 48.6588, <8> 36.5048, <9> 7.4901, <10> 24.6718, <11> 36.9237, <12> 30.5845, <13> 42.0376, <14> 22.7433, <15> 40.6749, <16> 24.8221, <17> 9.55, <18> 44.2262, <19> 26.5744, <20> 16.2919;
param capacity[MACHINE] := <1> 84.5256, <2> 84.5256, <3> 84.5256, <4> 84.5256, <5> 84.5256, <6> 84.5256, <7> 84.5256;

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
