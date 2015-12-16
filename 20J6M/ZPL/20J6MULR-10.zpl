set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.8293, <2> 27.8837, <3> 14.6781, <4> 42.9698, <5> 24.0872, <6> 2.4663, <7> 39.6397, <8> 7.6634, <9> 36.3489, <10> 10.1854, <11> 19.6856, <12> 11.8394, <13> 9.9376, <14> 30.8974, <15> 40.3773, <16> 4.4613, <17> 29.126, <18> 18.8093, <19> 3.4955, <20> 45.6957;
param workload[JOB] := <1> 37.2365, <2> 35.0184, <3> 47.9673, <4> 47.0806, <5> 9.2321, <6> 27.1464, <7> 32.5962, <8> 9.0553, <9> 10.0949, <10> 44.5984, <11> 12.8493, <12> 7.0444, <13> 19.1143, <14> 0.9775, <15> 25.8008, <16> 43.0245, <17> 30.427, <18> 14.888, <19> 43.9006, <20> 43.8829;
param capacity[MACHINE] := <1> 90.3226, <2> 90.3226, <3> 90.3226, <4> 90.3226, <5> 90.3226, <6> 90.3226;

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
