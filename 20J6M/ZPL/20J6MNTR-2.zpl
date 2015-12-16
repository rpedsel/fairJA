set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.5598, <2> 18.9161, <3> 24.6118, <4> 28.5066, <5> 20.2103, <6> 35.2172, <7> 23.7007, <8> 13.3529, <9> 32.649, <10> 21.6212, <11> 18.6513, <12> 21.6147, <13> 24.4331, <14> 17.585, <15> 26.4363, <16> 23.2592, <17> 22.5051, <18> 33.2316, <19> 20.0148, <20> 34.1453;
param workload[JOB] := <1> 28.674, <2> 21.2515, <3> 7.4039, <4> 26.302, <5> 19.9978, <6> 36.8674, <7> 28.625, <8> 19.4328, <9> 10.3264, <10> 27.3528, <11> 17.8106, <12> 37.4522, <13> 17.9972, <14> 34.5259, <15> 45.4013, <16> 44.6482, <17> 22.8507, <18> 7.3648, <19> 38.4789, <20> 26.9643;
param capacity[MACHINE] := <1> 64.966, <2> 64.966, <3> 64.966, <4> 64.966, <5> 64.966, <6> 64.966;

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
