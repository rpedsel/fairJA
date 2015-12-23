set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.5265, <2> 48.8845, <3> 6.6367, <4> 10.7622, <5> 24.875, <6> 1.0181, <7> 23.9583, <8> 13.3697, <9> 31.6803, <10> 44.7269, <11> 10.8111, <12> 20.8724, <13> 25.4247, <14> 6.4894, <15> 0.2962, <16> 7.4977, <17> 20.0921, <18> 1.9706, <19> 27.0815, <20> 23.6134;
param workload[JOB] := <1> 9.5265, <2> 48.8845, <3> 6.6367, <4> 10.7622, <5> 24.875, <6> 1.0181, <7> 23.9583, <8> 13.3697, <9> 31.6803, <10> 44.7269, <11> 10.8111, <12> 20.8724, <13> 25.4247, <14> 6.4894, <15> 0.2962, <16> 7.4977, <17> 20.0921, <18> 1.9706, <19> 27.0815, <20> 23.6134;
param capacity[MACHINE] := <1> 51.3696, <2> 51.3696, <3> 51.3696, <4> 51.3696, <5> 51.3696, <6> 51.3696, <7> 51.3696;

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
