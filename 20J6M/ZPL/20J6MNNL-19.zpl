set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7922, <2> 27.7028, <3> 18.7419, <4> 35.9273, <5> 24.3223, <6> 28.301, <7> 31.4335, <8> 23.9595, <9> 19.0076, <10> 24.4363, <11> 22.2731, <12> 30.3152, <13> 11.7519, <14> 32.5287, <15> 19.9913, <16> 27.3849, <17> 30.0491, <18> 23.6531, <19> 22.3322, <20> 21.4668;
param workload[JOB] := <1> 30.7922, <2> 27.7028, <3> 18.7419, <4> 35.9273, <5> 24.3223, <6> 28.301, <7> 31.4335, <8> 23.9595, <9> 19.0076, <10> 24.4363, <11> 22.2731, <12> 30.3152, <13> 11.7519, <14> 32.5287, <15> 19.9913, <16> 27.3849, <17> 30.0491, <18> 23.6531, <19> 22.3322, <20> 21.4668;
param capacity[MACHINE] := <1> 506.3707, <2> 506.3707, <3> 506.3707, <4> 506.3707, <5> 506.3707, <6> 506.3707;

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
