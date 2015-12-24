set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9119, <2> 27.6879, <3> 28.0205, <4> 18.3484, <5> 27.9484, <6> 31.741, <7> 29.9438, <8> 32.5699, <9> 17.3159, <10> 20.88, <11> 32.9744, <12> 24.1119, <13> 26.0571, <14> 24.3869, <15> 27.4637, <16> 31.6932, <17> 23.2648, <18> 34.02, <19> 28.4332, <20> 19.0069;
param workload[JOB] := <1> 22.9119, <2> 27.6879, <3> 28.0205, <4> 18.3484, <5> 27.9484, <6> 31.741, <7> 29.9438, <8> 32.5699, <9> 17.3159, <10> 20.88, <11> 32.9744, <12> 24.1119, <13> 26.0571, <14> 24.3869, <15> 27.4637, <16> 31.6932, <17> 23.2648, <18> 34.02, <19> 28.4332, <20> 19.0069;
param capacity[MACHINE] := <1> 56.655, <2> 56.655, <3> 56.655, <4> 56.655, <5> 56.655, <6> 56.655, <7> 56.655;

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
