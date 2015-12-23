set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.4164, <2> 12.3044, <3> 27.736, <4> 29.8529, <5> 40.3092, <6> 3.3237, <7> 35.5802, <8> 39.0872, <9> 18.6931, <10> 42.8094, <11> 49.1257, <12> 3.603, <13> 0.467, <14> 15.7346, <15> 48.8375, <16> 9.8421, <17> 18.4798, <18> 35.9579, <19> 42.1216, <20> 13.4953;
param workload[JOB] := <1> 18.4164, <2> 12.3044, <3> 27.736, <4> 29.8529, <5> 40.3092, <6> 3.3237, <7> 35.5802, <8> 39.0872, <9> 18.6931, <10> 42.8094, <11> 49.1257, <12> 3.603, <13> 0.467, <14> 15.7346, <15> 48.8375, <16> 9.8421, <17> 18.4798, <18> 35.9579, <19> 42.1216, <20> 13.4953;
param capacity[MACHINE] := <1> 72.2539, <2> 72.2539, <3> 72.2539, <4> 72.2539, <5> 72.2539, <6> 72.2539, <7> 72.2539;

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
