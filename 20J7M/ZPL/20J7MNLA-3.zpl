set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0692, <2> 19.4264, <3> 28.8283, <4> 27.2809, <5> 27.7264, <6> 19.4456, <7> 31.4761, <8> 22.0786, <9> 20.058, <10> 26.7902, <11> 30.7394, <12> 23.7376, <13> 26.8358, <14> 36.3551, <15> 27.9429, <16> 22.4809, <17> 25.6127, <18> 32.6583, <19> 22.3074, <20> 16.6917;
param workload[JOB] := <1> 443.9112, <2> 377.385, <3> 831.0709, <4> 744.2475, <5> 768.7533, <6> 378.1314, <7> 990.7449, <8> 487.4646, <9> 402.3234, <10> 717.7148, <11> 944.9107, <12> 563.4737, <13> 720.1602, <14> 1321.6933, <15> 780.8057, <16> 505.3909, <17> 656.0104, <18> 1066.5646, <19> 497.6201, <20> 278.6128;
param capacity[MACHINE] := <1> 1925.2842, <2> 1925.2842, <3> 1925.2842, <4> 1925.2842, <5> 1925.2842, <6> 1925.2842, <7> 1925.2842;

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