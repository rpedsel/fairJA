set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.4627, <2> 28.6592, <3> 17.7441, <4> 29.2349, <5> 27.1489, <6> 22.3278, <7> 27.3403, <8> 21.0804, <9> 21.9168, <10> 9.3827, <11> 20.5185, <12> 25.2541, <13> 22.7872, <14> 25.4052, <15> 19.8275, <16> 21.5118, <17> 22.9528, <18> 20.2858, <19> 29.2416, <20> 32.2793;
param workload[JOB] := <1> 1329.5285, <2> 821.3497, <3> 314.8531, <4> 854.6794, <5> 737.0628, <6> 498.5307, <7> 747.492, <8> 444.3833, <9> 480.3461, <10> 88.0351, <11> 421.0088, <12> 637.7696, <13> 519.2565, <14> 645.4242, <15> 393.1298, <16> 462.7575, <17> 526.831, <18> 411.5137, <19> 855.0712, <20> 1041.9532;
param capacity[MACHINE] := <1> 1310.4617, <2> 1310.4617, <3> 1310.4617, <4> 1310.4617, <5> 1310.4617, <6> 1310.4617, <7> 1310.4617;

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