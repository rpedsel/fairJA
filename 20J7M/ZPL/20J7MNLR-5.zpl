set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.2351, <2> 28.5333, <3> 26.5767, <4> 31.2653, <5> 16.1795, <6> 25.6663, <7> 25.4698, <8> 28.7677, <9> 31.0039, <10> 21.5325, <11> 20.7265, <12> 31.8884, <13> 24.414, <14> 24.8709, <15> 19.4407, <16> 22.422, <17> 27.5821, <18> 26.2297, <19> 24.2164, <20> 24.6268;
param workload[JOB] := <1> 46.803, <2> 48.0702, <3> 34.8223, <4> 28.321, <5> 17.88, <6> 46.6072, <7> 15.8301, <8> 39.1976, <9> 14.0417, <10> 18.071, <11> 35.8253, <12> 25.2776, <13> 5.6754, <14> 35.0957, <15> 28.9103, <16> 3.4269, <17> 12.6985, <18> 31.9188, <19> 4.3865, <20> 27.2891;
param capacity[MACHINE] := <1> 74.3069, <2> 74.3069, <3> 74.3069, <4> 74.3069, <5> 74.3069, <6> 74.3069, <7> 74.3069;

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
