set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3284, <2> 26.7348, <3> 25.0498, <4> 22.783, <5> 19.6472, <6> 29.7804, <7> 27.4576, <8> 18.4726, <9> 29.1237, <10> 30.5542, <11> 29.5382, <12> 31.3719, <13> 27.041, <14> 27.761, <15> 23.2179, <16> 23.589, <17> 23.8839, <18> 22.3821, <19> 23.5201, <20> 27.4536;
param workload[JOB] := <1> 37.7603, <2> 12.7934, <3> 19.5001, <4> 19.2258, <5> 36.1077, <6> 40.4026, <7> 27.0416, <8> 29.9771, <9> 24.5368, <10> 42.821, <11> 46.718, <12> 10.6396, <13> 6.4566, <14> 37.2069, <15> 41.7199, <16> 21.0247, <17> 29.7414, <18> 20.5242, <19> 24.0953, <20> 35.1961;
param capacity[MACHINE] := <1> 563.4891, <2> 563.4891, <3> 563.4891, <4> 563.4891, <5> 563.4891, <6> 563.4891;

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
