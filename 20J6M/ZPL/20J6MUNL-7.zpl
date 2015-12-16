set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.3628, <2> 29.7272, <3> 10.587, <4> 41.134, <5> 25.5985, <6> 21.6516, <7> 20.5677, <8> 19.8659, <9> 36.5115, <10> 25.7822, <11> 1.8158, <12> 2.2116, <13> 7.7314, <14> 20.8724, <15> 6.7437, <16> 25.6796, <17> 27.2174, <18> 46.9865, <19> 8.3984, <20> 24.948;
param workload[JOB] := <1> 36.3628, <2> 29.7272, <3> 10.587, <4> 41.134, <5> 25.5985, <6> 21.6516, <7> 20.5677, <8> 19.8659, <9> 36.5115, <10> 25.7822, <11> 1.8158, <12> 2.2116, <13> 7.7314, <14> 20.8724, <15> 6.7437, <16> 25.6796, <17> 27.2174, <18> 46.9865, <19> 8.3984, <20> 24.948;
param capacity[MACHINE] := <1> 440.3932, <2> 440.3932, <3> 440.3932, <4> 440.3932, <5> 440.3932, <6> 440.3932;

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
