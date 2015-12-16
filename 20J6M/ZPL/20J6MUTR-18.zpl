set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.4266, <2> 30.7773, <3> 19.4143, <4> 10.8053, <5> 49.3221, <6> 44.3073, <7> 32.4442, <8> 48.7452, <9> 43.9981, <10> 17.086, <11> 5.972, <12> 13.2139, <13> 26.8378, <14> 17.3185, <15> 20.0914, <16> 27.2868, <17> 13.8939, <18> 29.9177, <19> 14.1933, <20> 19.6307;
param workload[JOB] := <1> 29.259, <2> 21.0989, <3> 4.5275, <4> 35.934, <5> 25.204, <6> 41.2071, <7> 4.9649, <8> 20.7246, <9> 12.0534, <10> 27.1937, <11> 49.4046, <12> 3.0784, <13> 23.0733, <14> 11.8665, <15> 19.05, <16> 46.6306, <17> 42.3977, <18> 28.9844, <19> 7.7977, <20> 3.5977;
param capacity[MACHINE] := <1> 57.256, <2> 57.256, <3> 57.256, <4> 57.256, <5> 57.256, <6> 57.256;

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
