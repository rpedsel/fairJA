set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.0279, <2> 32.587, <3> 21.9582, <4> 20.4654, <5> 47.7215, <6> 35.6577, <7> 26.7422, <8> 39.5192, <9> 48.4307, <10> 26.5217, <11> 17.9804, <12> 45.9018, <13> 43.8835, <14> 1.3174, <15> 45.9331, <16> 12.5654, <17> 20.1783, <18> 14.8844, <19> 33.1553, <20> 33.06;
param workload[JOB] := <1> 6.3268, <2> 5.7085, <3> 4.686, <4> 4.5239, <5> 6.9081, <6> 5.9714, <7> 5.1713, <8> 6.2864, <9> 6.9592, <10> 5.1499, <11> 4.2403, <12> 6.7751, <13> 6.6245, <14> 1.1478, <15> 6.7774, <16> 3.5448, <17> 4.492, <18> 3.858, <19> 5.7581, <20> 5.7498;
param capacity[MACHINE] := <1> 11.4277, <2> 11.4277, <3> 11.4277, <4> 11.4277, <5> 11.4277, <6> 11.4277, <7> 11.4277;

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
