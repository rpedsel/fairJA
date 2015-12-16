set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.9157, <2> 26.3031, <3> 31.9133, <4> 24.4766, <5> 17.0034, <6> 17.17, <7> 23.5613, <8> 19.0989, <9> 17.3969, <10> 28.5401, <11> 30.858, <12> 21.3408, <13> 27.7065, <14> 21.8472, <15> 29.2025, <16> 23.5313, <17> 31.6228, <18> 23.729, <19> 19.4093, <20> 24.7869;
param workload[JOB] := <1> 35.3731, <2> 8.2186, <3> 7.0206, <4> 8.4842, <5> 37.8147, <6> 39.7939, <7> 21.6927, <8> 47.5712, <9> 19.2844, <10> 30.5565, <11> 42.8957, <12> 43.7467, <13> 31.3358, <14> 39.4709, <15> 29.2308, <16> 42.2599, <17> 7.83, <18> 31.2411, <19> 11.7451, <20> 26.9251;
param capacity[MACHINE] := <1> 70.3114, <2> 70.3114, <3> 70.3114, <4> 70.3114, <5> 70.3114, <6> 70.3114;

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
