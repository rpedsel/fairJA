set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.5688, <2> 27.8059, <3> 18.3018, <4> 26.921, <5> 31.6071, <6> 31.3716, <7> 22.5972, <8> 24.612, <9> 29.3054, <10> 24.6804, <11> 24.1112, <12> 23.7881, <13> 15.9081, <14> 25.4072, <15> 22.562, <16> 17.386, <17> 24.824, <18> 28.8114, <19> 29.3937, <20> 25.8982;
param workload[JOB] := <1> 4.2594, <2> 22.456, <3> 21.0937, <4> 11.4816, <5> 35.556, <6> 46.1989, <7> 31.3022, <8> 44.5549, <9> 19.7745, <10> 46.5436, <11> 27.1536, <12> 32.6498, <13> 47.8316, <14> 10.3477, <15> 17.1256, <16> 21.4916, <17> 42.4587, <18> 10.2312, <19> 5.1894, <20> 8.3378;
param capacity[MACHINE] := <1> 54.2183, <2> 54.2183, <3> 54.2183, <4> 54.2183, <5> 54.2183, <6> 54.2183, <7> 54.2183;

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
