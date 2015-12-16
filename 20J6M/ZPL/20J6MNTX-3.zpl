set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2796, <2> 21.4354, <3> 32.3662, <4> 21.8443, <5> 21.6763, <6> 28.0791, <7> 27.295, <8> 22.0055, <9> 24.5181, <10> 31.3646, <11> 22.8318, <12> 14.5322, <13> 29.1244, <14> 24.331, <15> 17.865, <16> 21.1128, <17> 30.483, <18> 21.1089, <19> 30.2972, <20> 21.0344;
param workload[JOB] := <1> 5.0279, <2> 4.6298, <3> 5.6891, <4> 4.6738, <5> 4.6558, <6> 5.299, <7> 5.2245, <8> 4.691, <9> 4.9516, <10> 5.6004, <11> 4.7783, <12> 3.8121, <13> 5.3967, <14> 4.9326, <15> 4.2267, <16> 4.5949, <17> 5.5211, <18> 4.5944, <19> 5.5043, <20> 4.5863;
param capacity[MACHINE] := <1> 12.2988, <2> 12.2988, <3> 12.2988, <4> 12.2988, <5> 12.2988, <6> 12.2988;

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
