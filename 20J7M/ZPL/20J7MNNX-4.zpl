set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2747, <2> 28.4123, <3> 31.2136, <4> 12.6354, <5> 23.4734, <6> 26.6872, <7> 16.7593, <8> 19.4091, <9> 31.3478, <10> 24.3972, <11> 22.7434, <12> 23.1673, <13> 27.4337, <14> 20.8309, <15> 33.8832, <16> 19.4258, <17> 27.1334, <18> 29.5188, <19> 26.3342, <20> 29.6642;
param workload[JOB] := <1> 5.1259, <2> 5.3303, <3> 5.5869, <4> 3.5546, <5> 4.8449, <6> 5.166, <7> 4.0938, <8> 4.4056, <9> 5.5989, <10> 4.9394, <11> 4.769, <12> 4.8132, <13> 5.2377, <14> 4.5641, <15> 5.8209, <16> 4.4075, <17> 5.209, <18> 5.4331, <19> 5.1317, <20> 5.4465;
param capacity[MACHINE] := <1> 99.479, <2> 99.479, <3> 99.479, <4> 99.479, <5> 99.479, <6> 99.479, <7> 99.479;

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
