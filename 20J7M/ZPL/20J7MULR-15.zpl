set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.3302, <2> 6.2781, <3> 24.7558, <4> 46.174, <5> 31.1321, <6> 27.229, <7> 24.7178, <8> 30.5908, <9> 32.4182, <10> 30.863, <11> 15.4737, <12> 6.8714, <13> 40.9243, <14> 45.1014, <15> 36.3813, <16> 35.9789, <17> 14.4191, <18> 13.983, <19> 18.1983, <20> 48.1153;
param workload[JOB] := <1> 38.851, <2> 44.2974, <3> 17.0619, <4> 27.848, <5> 23.7988, <6> 17.6702, <7> 26.963, <8> 23.4581, <9> 29.865, <10> 1.8698, <11> 23.3128, <12> 29.0172, <13> 1.6745, <14> 8.8233, <15> 42.5021, <16> 9.9446, <17> 4.6826, <18> 45.5009, <19> 32.1775, <20> 26.4452;
param capacity[MACHINE] := <1> 67.9663, <2> 67.9663, <3> 67.9663, <4> 67.9663, <5> 67.9663, <6> 67.9663, <7> 67.9663;

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
