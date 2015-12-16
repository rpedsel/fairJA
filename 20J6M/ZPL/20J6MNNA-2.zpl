set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.4804, <2> 29.6246, <3> 16.2305, <4> 26.2061, <5> 30.6784, <6> 27.4587, <7> 22.26, <8> 26.4034, <9> 32.4736, <10> 37.3361, <11> 29.2467, <12> 37.2079, <13> 26.1482, <14> 24.7196, <15> 25.9136, <16> 19.7052, <17> 21.4157, <18> 24.8843, <19> 24.4635, <20> 31.0778;
param workload[JOB] := <1> 155.7604, <2> 877.6169, <3> 263.4291, <4> 686.7597, <5> 941.1642, <6> 753.9802, <7> 495.5076, <8> 697.1395, <9> 1054.5347, <10> 1393.9844, <11> 855.3695, <12> 1384.4278, <13> 683.7284, <14> 611.0586, <15> 671.5147, <16> 388.2949, <17> 458.6322, <18> 619.2284, <19> 598.4628, <20> 965.8297;
param capacity[MACHINE] := <1> 14556.4237, <2> 14556.4237, <3> 14556.4237, <4> 14556.4237, <5> 14556.4237, <6> 14556.4237;

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
