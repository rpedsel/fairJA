set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3404, <2> 20.3635, <3> 26.9778, <4> 19.986, <5> 32.2143, <6> 25.2967, <7> 20.6358, <8> 18.2064, <9> 22.4358, <10> 31.5914, <11> 30.6322, <12> 28.4498, <13> 23.7751, <14> 28.7311, <15> 24.361, <16> 25.4892, <17> 25.1449, <18> 29.964, <19> 29.8056, <20> 25.6036;
param workload[JOB] := <1> 4.7266, <2> 4.5126, <3> 5.194, <4> 4.4706, <5> 5.6758, <6> 5.0296, <7> 4.5427, <8> 4.2669, <9> 4.7366, <10> 5.6206, <11> 5.5346, <12> 5.3338, <13> 4.876, <14> 5.3601, <15> 4.9357, <16> 5.0487, <17> 5.0145, <18> 5.4739, <19> 5.4595, <20> 5.06;
param capacity[MACHINE] := <1> 100.8728, <2> 100.8728, <3> 100.8728, <4> 100.8728, <5> 100.8728, <6> 100.8728, <7> 100.8728;

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
